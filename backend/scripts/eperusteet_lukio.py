import ujson
from datetime import datetime
from collections import namedtuple

from utils import get_localized_value, html_to_plaintext, format_credits

Moduuli = namedtuple('Moduuli', ['id', 'description', 'title', 'credits'])


class LukioOppiaine(object):
    def __init__(self):
        self.original_id = None
        self.id = None
        self.url = None
        self.name = None
        self.description = None
        self.courses = []


    def load_json(self, json):
        self.original_id = json['id']
        self.id = f"eperusteet-lukio-{json['id']}"
        self.name = get_localized_value(json['nimi'])
        self.url = f"https://eperusteet.opintopolku.fi/#/fi/lukiokoulutus/6828810/oppiaine/{json['id']}"

        short_description = html_to_plaintext(json['tehtava']['kuvaus']['fi'])
        long_description = html_to_plaintext(json['tehtava']['kuvaus']['fi'])

        if json['laajaAlaisetOsaamiset']:
            long_description += '\n\n' + html_to_plaintext(json['laajaAlaisetOsaamiset']['kuvaus']['fi'])

        goals = html_to_plaintext(get_localized_value(json['tavoitteet']['kuvaus']))
        if goals:
            long_description += '\n\n' + goals

        for tavoitealue in json['tavoitteet']['tavoitealueet']:
            long_description += '\n\n' + get_localized_value(tavoitealue['nimi'])

            for tavoite in tavoitealue['tavoitteet']:
                long_description += '\n- ' + get_localized_value(tavoite)

        self.description = long_description

        # Create a virtual course with long description so that the long description is utilized in matching
        self.courses.append(Moduuli(id=self.id, description=long_description, title=self.name, credits=None))

        self.parse_modules(json['moduulit'])

        for oppimaara in json['oppimaarat']:
            course_id = f"eperusteet-lukio-oppimaara-{oppimaara['id']}"
            course_name = get_localized_value(oppimaara['nimi'])
            description = ''

            if oppimaara['tehtava']:
                tehtava_kuvaus = html_to_plaintext(get_localized_value(oppimaara['tehtava']['kuvaus']))
                if tehtava_kuvaus:
                    description += tehtava_kuvaus + '\n'

            tavoite_kuvaus = html_to_plaintext(get_localized_value(oppimaara['tavoitteet']['kuvaus']))
            if tavoite_kuvaus:
                description += tavoite_kuvaus + '\n'

            for tavoitealue in oppimaara['tavoitteet']['tavoitealueet']:
                if tavoitealue['nimi']:
                    description += '- ' + get_localized_value(tavoitealue['nimi']) + '\n'

                for tavoite in tavoitealue['tavoitteet']:
                    description += '- ' + get_localized_value(tavoite) + '\n'

            self.courses.append(Moduuli(id=course_id, title=course_name, description=description, credits=None))
            self.parse_modules(oppimaara['moduulit'])


    def parse_modules(self, json):
        for moduuli in json:
            course_id = f"eperusteet-lukio-course-{moduuli['id']}"
            course_name = get_localized_value(moduuli['nimi'])
            course_credits = format_credits(moduuli['laajuus'])

            if moduuli['kuvaus']:
                moduuli_description = html_to_plaintext(get_localized_value(moduuli['kuvaus'])) + '\n'
            else:
                moduuli_description = ''

            for tavoite in moduuli['tavoitteet']['tavoitteet']:
                moduuli_description += '- ' + get_localized_value(tavoite) + '\n'

            for sisalto in moduuli['sisallot']:
                kohde = get_localized_value(sisalto['kohde']) # e.g. "Ihmisen toiminnan tarkastelu psykologian näkökulmista"
                if kohde:
                    moduuli_description += '- ' + kohde + '\n'

                for item in sisalto['sisallot']:
                    moduuli_description += '- ' + get_localized_value(item) + '\n'

            self.courses.append(Moduuli(id=course_id, title=course_name, description=moduuli_description, credits=course_credits))

    def course_texts(self):
        ''' Renders texts for indexing.
        Each document is a "course" aka "moduuli".
        '''
        for course in self.courses:
            text = course.title + '\n\n' + course.description
            metadata = {
                'title': course.title,
                'credits': course.credits,
            }

            yield course.id, text, metadata


    def mongo_document(self):
        if not (self.name and self.url):
            raise Exception("Missing values")

        return {
            'title': self.name,
            'description': self.description or '',
            'credits': None,
            'field': 'Yleissivistävä',
            'level': 'Lukio',
            'degrees': ['Ylioppilastutkinto'],
            'url': self.url,
            'organizers': [],
            'organizer_aliases': ['Lukio']
        }
