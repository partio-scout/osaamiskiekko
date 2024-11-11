# Reads from ePerusteet, stores json files to local filesystem for further processing

import os
import time
import requests
import ujson
from datetime import datetime

HEADERS = {'Caller-Id': 'osaamiskiekko'}

KOULUTUSTYYPIT = [
    1, 5, 10, 11, 12, 18, 30, 40
]


def fetch_amosaa_courses(koulutustyyppi):
    ids = fetch_opetussuunnitelmat(koulutustyyppi)
    course_count = len(ids)

    counter = 0
    for koulutustoimija_id, id in ids:
        print(f"Fetching course {counter} / {course_count}")
        fetch_amosaa_course(koulutustoimija_id, id)
        counter += 1
        time.sleep(1)

def fetch_opetussuunnitelmat(koulutustyyppi):
    current_page = 0

    results = []  # (koulutustoimija_id, id)

    while True:
        print(f"Fetching type {koulutustyyppi}, page {current_page}")
        url = f"https://eperusteet.opintopolku.fi/eperusteet-amosaa-service/api/julkinen/opetussuunnitelmat/julkaisut?sivukoko=200&sivu={current_page}&koulutustyyppi=koulutustyyppi_{koulutustyyppi}"

        response = requests.get(url=url, headers=HEADERS)
        if not response.ok:
            raise Exception(f"Failed to fetch 'opetussuunnitelma' (server responded {response.status_code})")

        json = ujson.loads(response.text)

        # Read programmes and organizations
        for opetussuunnitelma in json['data']:
            name = get_localized_value(opetussuunnitelma['nimi'])
            org = get_localized_value(opetussuunnitelma['koulutustoimija']['nimi'])
            koulutustoimija_id = opetussuunnitelma['koulutustoimija']['id']
            id = opetussuunnitelma['id']
            results.append((koulutustoimija_id, id))

        max_pages = json['sivuja']
        if not max_pages or current_page >= max_pages - 1:
            break

        current_page += 1
        time.sleep(1)

    return results


def fetch_amosaa_course(koulutustoimija_id, id):
    url = f'https://eperusteet.opintopolku.fi/eperusteet-amosaa-service/api/julkinen/koulutustoimijat/{koulutustoimija_id}/opetussuunnitelmat/{id}/julkaisu'
    response = requests.get(url=url, headers=HEADERS)

    if not response.ok:
        print(response.status_code)
        print(response.text)
        raise Exception(f"Failed to fetch AMOSAA course (server responded {response.status_code})")

    with open(os.path.join('amosaa-courses', f'{id}.json'), 'w') as f:
        f.write(response.text)


def fetch_formal_education(koulutustyypit):
    for koulutustyyppi in koulutustyypit:
        print(f"Koulutustyyppi {koulutustyyppi}")
        ids = fetch_ammatillinen_toc(koulutustyyppi) or []
        course_count = len(ids)

        counter = 0
        for id in ids:
            print(f"Fetching course {counter} / {course_count}")
            fetch_programme(id)
            fetch_ammatillinen_organizers(id)
            counter += 1
            time.sleep(1)


def fetch_ammatillinen_toc(koulutustyyppi):
    current_page = 0
    results = []
    ids = []

    while True:
        print(f"Fetching type {koulutustyyppi}, page {current_page}")

        url = f'https://eperusteet.opintopolku.fi/eperusteet-service/api/perusteet/julkaisut?koulutustyyppi=koulutustyyppi_{koulutustyyppi}&kieli=fi&tulevat=true&voimassa=true&siirtyma=true&poistuneet=false&koulutusvienti=false&sivukoko=10&sivu={current_page}'
        response = requests.get(url=url, headers=HEADERS)
        if not response.ok:
            print(response.status_code)
            break

        json = ujson.loads(response.text)

        results.extend(json['data'])

        for item in json['data']:
            ids.append(item['id'])

        max_pages = json['sivuja']
        if not max_pages or current_page >= max_pages - 1:
            break

        current_page += 1
        time.sleep(1)

    if not results:
        return

    #with open(f'ammatilliset-{koulutustyyppi}.json', 'w') as f:
        #f.write(ujson.dumps(results, indent=2, ensure_ascii=False, escape_forward_slashes=False))

    #with open(f'ammatilliset-{koulutustyyppi}.txt', 'w') as f:
        #for item in results:
            #name = get_localized_value(item['nimi'])
            #f.write(f'{name}\n')

    #print(response.text)
    #with open(f'amosaa-{id}.json', 'w') as f:
    #    f.write(response.text)

    return ids


def fetch_programme(id):
    url = f'https://eperusteet.opintopolku.fi/eperusteet-service/api/perusteet/{id}/kaikki'
    response = requests.get(url=url, headers=HEADERS)

    if not response.ok:
        raise Exception(f"Failed to fetch (server responded {response.status_code})")

    with open(os.path.join('ammatilliset-courses', f'{id}.json'), 'w') as f:
        f.write(response.text)


def fetch_ammatillinen_organizers(id):
    url = f'https://eperusteet.opintopolku.fi/eperusteet-amosaa-service/api/julkinen/opetussuunnitelmat/julkaisut?perusteId={id}&sivu=0&sivukoko=100'
    response = requests.get(url=url, headers=HEADERS)

    if not response.ok:
        raise Exception(f"Failed to fetch (server responded {response.status_code})")

    with open(os.path.join('ammatilliset-organizers', f'{id}.json'), 'w') as f:
        f.write(response.text)


def get_localized_value(item):
    for lang in ['fi', 'sv', 'en']:
        if lang in item:
            return item[lang]


if __name__ == '__main__':
    # Create directories
    for directory in ['ammatilliset-courses', 'ammatilliset-organizers', 'amosaa-courses']:
        if not os.path.isdir(directory):
            os.makedirs(directory)

    fetch_amosaa_courses(10)

    fetch_formal_education([1,5,11,12,18])

    # Lukio
    fetch_programme(6828810)
