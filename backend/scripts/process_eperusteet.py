# - Reads ePerusteet json files from local filesystem
# - Writes to MongoDB
# - Creates an ndjson file for the search engine

# Usage: python scripts/process_eperusteet.py

import os
import glob
import ujson
import requests

from eperusteet_formal import FormalDegree
from eperusteet_lukio import LukioOppiaine
from eperusteet_hobby import HobbyOrganization

API_KEY = os.environ['API_KEY']
API_URLS = [
    #"http://localhost:3000/api/v1",
    "http://osaamiskiekko.vxt-research.com/api/v1"
]

def upload_one(endpoint, document):
    for api_url in API_URLS:
        response = requests.post(api_url + endpoint + f"?api_key={API_KEY}", json=document)
        if response.status_code != 200:
            raise Exception(f"Upload failed\nPOST {endpoint}\nStatus code: {response.status_code}\n{response.text}")


def upload_many(endpoint, documents):
    for id, document in documents:
        upload_one(endpoint.format(id), document)
        #print(ujson.dumps(document, indent=2))


def process_formal():
    counter = 0

    # Store a mapping of which degrees contain which course IDs
    # because for matching, we need to fetch all courses belonging to a degree.
    course_ids = {} # { degree_id: [course_ids] }

    try:
        with open('fields.json') as f:
            fields = ujson.loads(f.read())
    except FileNotFoundError:
        print("fields.json missing. Generate it by running python scripts/load_fields.py")
        exit(1)

    with open('formal_courses.ndjson', 'w') as output_file:
        seen_course_ids = set()

        for path in glob.glob(os.path.join('ammatilliset-courses', '*.json')):
            #print(f"Loading {path}")

            degree = FormalDegree()
            with open(path) as input_file:
                degree.load_json(ujson.loads(input_file.read()), fields)

            if degree.expired:
                continue

            try:
                organizers_path = os.path.join('ammatilliset-organizers', f'{degree.original_id}.json')
                with open(organizers_path) as organizers_file:
                    degree.load_organizers(ujson.loads(organizers_file.read()))
            except FileNotFoundError:
                print(f"WARNING: No organizer data for {path}")

            ids = []
            for course_id, course_text, course_metadata in degree.course_texts():
                if len(course_text) < 64:
                    #print(f"WARNING: no description in {path} / {course_id} {course_metadata['title']}")
                    continue

                if course_id not in seen_course_ids: # The same course can appear in different files (with the same content)
                    json = {
                        'id': course_id,
                        'texts': {
                            'content': course_text
                        },
                        'metadata': course_metadata
                    }
                    seen_course_ids.add(course_id)
                    output_file.write(ujson.dumps(json, ensure_ascii=False, escape_forward_slashes=False))
                    output_file.write('\n')

                ids.append(course_id)

            doc = degree.degree_mongo_document()
            upload_one(f"/formal_degrees/{degree.id}", doc)
            course_ids[degree.id] = ids

            #counter += 1
            #if counter > 10:
                #break

    with open('formal-degrees-courses.json', 'w') as f:
        f.write(ujson.dumps(course_ids, indent=2))


def process_hobby():
    counter = 0

    with open('hobby_courses.ndjson', 'w') as output_file:
        for path in glob.glob(os.path.join('amosaa-courses', '*.json')):
            organization = HobbyOrganization()

            with open(path) as input_file:
                organization.load_json(ujson.loads(input_file.read()))

            if organization.blacklisted:
                continue

            for course_id, course_text, course_metadata in organization.course_texts():
                json = {
                    'id': course_id,
                    'texts': {
                        'content': course_text
                    },
                    'metadata': course_metadata
                }
                output_file.write(ujson.dumps(json, ensure_ascii=False, escape_forward_slashes=False))
                output_file.write('\n')

            upload_many("/hobby_courses/{}", organization.course_mongo_documents())

            #counter += 1
            #if counter > 10:
                #break


def process_lukio():
    counter = 0
    course_ids = {} # { degree_id: [course_ids] }

    with open('lukio_courses.ndjson', 'w') as output_file:
        path = 'lukio.json'
        with open(path) as input_file:
            json = ujson.loads(input_file.read())
            for oppiaine_json in json['lops2019']['oppiaineet']:
                oppiaine = LukioOppiaine()
                oppiaine.load_json(oppiaine_json)

                if len(oppiaine.courses) < 2: # The main description is always added
                    continue

                ids = []
                for course_id, course_text, course_metadata in oppiaine.course_texts():
                    if len(course_text) < 64:
                        continue

                    json = {
                        'id': course_id,
                        'texts': {
                            'content': course_text
                        },
                        'metadata': course_metadata
                    }
                    output_file.write(ujson.dumps(json, ensure_ascii=False, escape_forward_slashes=False))
                    output_file.write('\n')
                    ids.append(course_id)

                doc = oppiaine.mongo_document()
                upload_one(f"/formal_degrees/{oppiaine.id}", doc)
                course_ids[oppiaine.id] = ids

    with open('lukio-courses.json', 'w') as f:
        f.write(ujson.dumps(course_ids, indent=2))


def reset(endpoint):
    for api_url in API_URLS:
        response = requests.delete(api_url + endpoint)
        if response.status_code != 200:
            print(response.status_code)
            print(response.text)
            exit(1)


if __name__ == "__main__":
    reset(f'/formal?api_key={API_KEY}')
    reset(f'/hobby?api_key={API_KEY}')

    process_formal()
    process_hobby()
    process_lukio()
