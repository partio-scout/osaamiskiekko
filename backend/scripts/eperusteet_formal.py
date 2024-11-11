import ujson
from datetime import datetime
from collections import namedtuple

from utils import get_localized_value, html_to_plaintext, format_credits
from field_aliases import FIELD_ALIASES

KNOWN_TUTKINNONOSA_KEYS = set(['id', 'luotu', 'muokattu', 'muokkaaja', 'nimi', 'tila', 'osanTyyppi', 'kuvaus', 'opintoluokitus', 'koodi', 'koodiUri', 'koodiArvo', 'osaAlueet', 'tyyppi', 'valmaTelmaSisalto', 'geneerinenArviointiasteikko', 'vapaatTekstit', 'ammattitaitovaatimukset2019', 'ammattitaidonOsoittamistavat', 'ammattitaitovaatimukset', 'arviointi', 'valmis', 'kaannettava', 'tavoitteet', 'ammattitaitovaatimuksetLista'])

Tutkinnonosa = namedtuple('Tutkinnonosa', ['id', 'description', 'title', 'credits'])


class FormalDegree(object):
    def __init__(self):
        self.original_id = None
        self.id = None
        self.url = None
        self.name = None
        self.description = None
        self.field = None
        self.level = None
        self.credits = None
        self.expired = False
        self.courses = []
        self.tutkintonimikkeet = set()
        self.organizers = set()


    def load_json(self, json, fields={}):
        course_credits = {} # {"course_id": credits}
        self.original_id = json['id']
        self.id = f"eperusteet-degree-{json['id']}"
        self.name = get_localized_value(json['nimi'])
        self.description = get_localized_value(json['kuvaus'])
        self.url = f"https://eperusteet.opintopolku.fi/#/fi/kooste/ammatillinen/{json['id']}"

        field_data = fields.get(self.name)
        if field_data:
            self.field = field_data['field']
            self.level = field_data['level']
        else:
            print(f"WARNING: Field and level not found for {self.name}")

        for tutkintonimike in json.get('tutkintonimikkeet', []):
            self.tutkintonimikkeet.add(get_localized_value(tutkintonimike['nimi']))

        # Read credits
        min_credits = None
        max_credits = None
        for item in json.get('suoritustavat', []):
            rule = item.get('rakenne', {}).get('muodostumisSaanto')
            if not rule:
                continue

            local_min = rule['laajuus']['minimi']
            local_max = rule['laajuus']['maksimi']
            if min_credits is None or (local_min and local_min < min_credits):
                min_credits = local_min

            if max_credits is None or (local_max and local_max > max_credits):
                max_credits = local_max

            for viite in item.get('tutkinnonOsaViitteet', []):
                tutkinnonosa_id = int(viite['_tutkinnonOsa'])  # It's actually presented as a string here, while the actual ID is an integer
                course_credits[tutkinnonosa_id] = format_credits(viite['laajuus'])

        if min_credits:
            if min_credits != max_credits:
                self.credits = f"{min_credits} - {max_credits} op"
            else:
                self.credits = f"{min_credits} op"
        else:
            self.credits = '-'

        raw_expiration = json['voimassaoloLoppuu']
        if raw_expiration:
            expires = datetime.fromtimestamp(raw_expiration / 1000)
            self.expired = expires > datetime.now()
        else:
            expires = None
            self.expired = False

        if self.expired:
            return

        # tyotehtavat_html = get_localized_value(json['tyotehtavatJoissaVoiToimia'])
        # osaaminen_html = get_localized_value(json['suorittaneenOsaaminen'])

        for tutkinnonosa in json.get('tutkinnonOsat', []):
            tutkinnonosa_name, texts = self.parse_tutkinnonosa(tutkinnonosa)
            tutkinnonosa_id = tutkinnonosa['id']

            if not tutkinnonosa_name:
                raise Exception("Missing tutkinnonosa_name")

            tutkinnonosa = Tutkinnonosa(
                id = f"eperusteet-formal-course-{tutkinnonosa_id}",
                description = '\n\n'.join(texts),
                title = tutkinnonosa_name,
                credits = course_credits.get(tutkinnonosa_id)
            )
            self.courses.append(tutkinnonosa)


    def parse_tutkinnonosa(self, json):
        texts = []

        unknown_keys = set(json.keys()) - KNOWN_TUTKINNONOSA_KEYS
        if unknown_keys:
            raise Exception(f'"tutkinnonOsa" contains unknown keys: {unknown_keys}')

        name = get_localized_value(json['nimi'])
        #description = json.get('kuvaus') # Not useful
        #vapaatTekstit = json['vapaatTekstit'] # Not useful
        #arviointi = json.get('arviointi') # Generic, not useful

        if 'tavoitteet' in json:
            tavoitteet = html_to_plaintext(get_localized_value(json['tavoitteet']))
            texts.append(tavoitteet)

        if 'ammattitaitovaatimukset2019' in json:
            for alue in json['ammattitaitovaatimukset2019']['kohdealueet']:
                kohde = get_localized_value(alue['kuvaus'])
                if kohde:
                    texts.append(kohde)

        osoittamistavat = get_localized_value(json.get('ammattitaidonOsoittamistavat'))
        ammattitaitovaatimukset = get_localized_value(json.get('ammattitaitovaatimukset'))

        if osoittamistavat:
            texts.append(html_to_plaintext(osoittamistavat))

        if ammattitaitovaatimukset:
            texts.append(html_to_plaintext(ammattitaitovaatimukset))

        return name, texts


    def load_organizers(self, json):
        for instance in json['data']:
            organizer = instance.get('koulutustoimija')
            if not organizer:
                continue

            name = get_localized_value(organizer.get('nimi'))
            self.organizers.add(name)


    def course_texts(self):
        ''' Renders texts for indexing.
        Each document is a "course" i.e. tutkinnonosa.
        '''
        for course in self.courses:
            text = course.title + '\n\n' + course.description
            metadata = {
                'title': course.title,
                'credits': course.credits,
            }

            yield course.id, text, metadata


    def degree_mongo_document(self):
        if not (self.name and self.url):
            raise Exception("Missing values")

        return {
            'title': self.name,
            'description': self.description or '',
            'credits': self.credits,
            'field': FIELD_ALIASES.get(self.field) or self.field,
            'level': self.level,
            'degrees': list(self.tutkintonimikkeet),
            'url': self.url,
            'organizers': sorted(self.organizers),
            'organizer_aliases': []
        }
