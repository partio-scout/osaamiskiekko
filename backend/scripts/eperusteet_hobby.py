import os
import glob
import time
import requests
import ujson
from datetime import datetime
from collections import namedtuple

from utils import get_localized_value, html_to_plaintext, format_credits
from field_aliases import FIELD_ALIASES

Hobbycourse = namedtuple('Hobbycourse', ['id', 'title', 'content', 'description', 'credits', 'organization_id', 'organization_name', 'field', 'url'])

KNOWN_AMOSAA_KEYS = set(['id', 'nimi', 'tila', 'tyyppi', 'kuvaus', 'koulutustoimija', 'luotu', 'muokattu', 'peruste', 'tila2016', 'jotpatyyppi', 'kommentti', 'julkaisukielet', 'liitteet', 'paatospaivamaara', 'voimaantulo', 'voimassaoloLoppuu', 'hyvaksyja', 'paatosnumero', 'suoritustapa', 'esikatseltavissa', 'tutkintonimikkeet', 'osaamisalat', 'oppilaitosTyyppiKoodiUri', 'oppilaitosTyyppiKoodi', 'koulutustyyppi', 'viimeisinJulkaisuAika', 'sisalto', 'suorituspolut', 'tutkinnonOsat', 'opintokokonaisuudet', 'perusteDiaarinumero', '_pohja', 'perustePaivitettyPvm'])
KNOWN_SISALTO_KEYS = set(['id', 'tyyppi', 'naytaPohjanTeksti', 'naytaPerusteenTeksti', 'lapset', 'tekstiKappale', 'nimi', 'opintokokonaisuus', 'perusteteksti', 'pohjanTekstikappale', 'perusteenOsaId', 'osaAlueet'])
KNOWN_OPINTOKOKONAISUUS_KEYS = set(['id', 'nimiKoodi', 'koodi', 'kuvaus', 'laajuus', 'laajuusYksikko', 'minimilaajuus', 'tyyppi', 'opetuksenTavoiteOtsikko', 'tavoitteet', 'arvioinninKuvaus', 'tavoitteidenKuvaus', 'keskeisetSisallot', 'arvioinnit', 'koodiArvo', 'kooditettuNimi'])

# https://www.opintokeskukset.fi/opintokeskukset/
# ORG_WHITELIST = set([
#     'Opintokeskus Sivis',
#     'Työväen sivistysliitto TSL ry:n opintokeskus',
#     'Toimihenkilöjärjestöjen Sivistysliitto TJS Opintokeskus - Funktionärsorganisationernas Bildningsförbund FOB Studiecentrum (TJS Opintokeskus)',
#     'Maaseudun Sivistysliiton MSL-opintokeskus',
# ])

class HobbyOrganization(object):
    def __init__(self):
        self.id = None
        self.org_id = None
        self.org_name = None
        self.expired = False
        self.blacklisted = False
        self.courses = []

    def load_json(self, json):
        unknown_keys = set(json.keys()) - KNOWN_AMOSAA_KEYS
        if unknown_keys:
            print("Unknown keys:")
            print(unknown_keys)
            raise Exception("Amosaa course contains unknown keys")

        self.original_id = json['id']
        self.id = f"eperusteet-hobby-degree-{json['id']}"
        self.org_id = json['koulutustoimija']['id']
        self.org_name = get_localized_value(json['koulutustoimija']['nimi'])

        raw_expiration = json['voimassaoloLoppuu']
        if raw_expiration:
            expires = datetime.fromtimestamp(raw_expiration / 1000)
            self.expired = expires > datetime.now()
        else:
            expires = None
            self.expired = False

        # if self.org_name not in ORG_WHITELIST:
        #     self.blacklisted = True
        #     return

        if self.expired:
            print(f"NOTE: Including expired: {self.org_name}")
            #return

        self.parse_sisalto(json['sisalto'], self.org_name)


    def parse_sisalto(self, json, parent_name, depth=0):
        indentation = '  ' * depth

        unknown_keys = set(json.keys()) - KNOWN_SISALTO_KEYS
        if unknown_keys:
            raise Exception(f'"sisalto" contains unknown keys: {unknown_keys}')

        paragraph = json.get('tekstiKappale')
        name = ""
        if paragraph:
            name = get_localized_value(paragraph['nimi']) # Course name

            text_node = paragraph['teksti']
            if text_node:
                html = get_localized_value(text_node)
                plaintext = html_to_plaintext(html)

        if 'pohjanTekstikappale' in json:
            parent_name = get_localized_value(json['pohjanTekstikappale']['nimi'])  # Heading, could be useful for classifying contents below

        for child in json.get('lapset', []):
            self.parse_sisalto(child, parent_name, depth + 1)

        if json['tyyppi'] == "opintokokonaisuus":
            if not name:
                print(f"opintokokonaisuus {json['id']} is missing name")
                return

            child_count = len(json.get('lapset', []))

            # If it's a leaf node, make it a new document
            if child_count == 0:
                credits, texts = parse_opintokokonaisuus(json.get('opintokokonaisuus'), depth)

                description = '' # Shown in UI
                for heading in ['Kuvaus', 'Sisällöt', 'Tavoitteet', 'Tavoitteiden kuvaus']:
                    if not heading in texts:
                        continue

                    payload = texts[heading]
                    if not payload:
                        continue

                    if heading == 'Kuvaus':
                        description += f"{payload}\n\n"
                    else:
                        description += f"{heading}:\n{payload}\n\n"

                content = '' # Used in matching
                for heading in ['Kuvaus', 'Sisällöt', 'Tavoitteet', 'Tavoitteiden kuvaus', 'Arvioinnit']:
                    if not heading in texts:
                        continue

                    payload = texts[heading]
                    content += payload + '\n\n'

                if not parent_name:
                    print(f"opintokokonaisuus {json['id']} is missing field")
                    return

                if not (name and self.org_name):
                    print(f"name={name}, org={self.org_name}, field={parent_name}")
                    raise Exception("Missing values")

                course = Hobbycourse(
                    id = f"eperusteet-hobby-course-{json['id']}",
                    description = description.strip(), # Shown in UI
                    content = content.strip(),         # Used in matching
                    title = name,
                    credits = credits,
                    organization_id = str(self.org_id),
                    organization_name = self.org_name,
                    field = parent_name,
                    url = f'https://eperusteet.opintopolku.fi/#/fi/toteutussuunnitelma/{self.original_id}/vapaasivistystyo/sisalto/{json["id"]}'
                )

                self.courses.append(course)

    def course_texts(self):
        ''' Renders texts for indexing.
        Each document is a "course".
        '''
        for course in self.courses:
            text = ''
            if course.title:
                text += course.title

            if course.content:
                text += '\n\n' + course.content

            metadata = {
                'title': course.title,
                'credits': course.credits
            }
            yield course.id, text, metadata


    def course_mongo_documents(self):
        for course in self.courses:
            json = {
                'title': course.title,
                'description': course.description,
                'credits': course.credits,
                'organization_id': course.organization_id,
                'organization_name': course.organization_name,
                'field': FIELD_ALIASES.get(course.field) or course.field,
                'url': course.url
            }
            yield course.id, json


def parse_opintokokonaisuus(json, depth):
    if json is None:
        return None

    texts = {}
    indentation = '  ' * depth

    unknown_keys = set(json.keys()) - KNOWN_OPINTOKOKONAISUUS_KEYS
    if unknown_keys:
        raise Exception(f'"opintokokonaisuus" contains unknown keys: {unknown_keys}')

    credits = format_credits(json.get('laajuus'))

    description_html = get_localized_value(json['kuvaus'])
    outcome = get_localized_value(json.get('opetuksenTavoiteOtsikko'))
    goals_description_html = get_localized_value(json.get('tavoitteidenKuvaus'))
    contents_html = get_localized_value(json.get('keskeisetSisallot'))
    assessment_html = get_localized_value(json.get('arvioinnit'))

    goals = [
        get_localized_value(tavoite['tavoite'])
        for tavoite in json.get('tavoitteet', [])
    ]
    if goals:
        texts['Tavoitteet'] = '\n'.join(goals)

    #if outcome:
    #    texts.append(outcome) # Usually generic heading

    if description_html:
        texts['Kuvaus'] = html_to_plaintext(description_html)
        #print(html_to_plaintext(description_html))

    if goals_description_html:
        text = html_to_plaintext(goals_description_html)
        if text != 'Kurssin osaamisperusteiset tavoitteet':
            texts['Tavoitteiden kuvaus'] = text
        #print(html_to_plaintext(goals_description_html))

    if contents_html:
        texts['Sisällöt'] = html_to_plaintext(contents_html)
        #print(html_to_plaintext(contents_html))

    if assessment_html:
        texts['Arvioinnit'] = html_to_plaintext(assessment_html) # Often generic, but can contain substance
        #print(html_to_plaintext(assessment_html))

    return credits, texts
