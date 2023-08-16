import os
import psycopg
import ujson
import hashlib
import requests

from utils import format_credits
from process_eperusteet import upload_one
from field_aliases import FIELD_ALIASES

DB_NAME = os.environ.get('POSTGRES_DB', 'scraper')
DB_CONNECTION = f"dbname={DB_NAME}"



SCHOOL_SHORTHANDS = {
    "turkuamk": "Turun AMK",
    "lapit": "Lapin AMK",
    "seamk": "SeAMK",
}

SCHOOL_ALIASES = {
    "arcada": "Yrkeshögskolan Arcada",
    "centria": "Centria ammattikorkeakoulu (Keski-Pohjanmaa)",
    "diak": "Diakonia-ammattikorkeakoulu",
    "haaga-helia": "HAAGA-HELIA ammattikorkeakoulu",
    "hamk": "Hämeen ammattikorkeakoulu",
    "humak": "Humanistinen ammattikorkeakoulu",
    "jamk": "Jyväskylän ammattikorkeakoulu",
    "kamk": "Kajaanin ammattikorkeakoulu",
    "karelia": "Karelia-ammattikorkeakoulu",
    "lab": "Lab-ammattikorkeakoulu (Lahti)",
    "lapit": "Lapin ammattikorkeakoulu",
    "laurea": "Laurea-ammattikorkeakoulu",
    "metropolia": "Metropolia Ammattikorkeakoulu",
    "novia": "Yrkeshögskolan Novia",
    "oamk": "Oulun Ammattikorkeakoulu",
    "samk": "Satakunnan ammattikorkeakoulu",
    "savonia": "Savonia-ammattikorkeakoulu (Kuopio)",
    "seamk": "Seinäjoen ammattikorkeakoulu",
    "tamk": "Tampereen ammattikorkeakoulu",
    "turkuamk": "Turun ammattikorkeakoulu",
    "vamk": "Vaasan ammattikorkeakoulu",
    "xamk": "Kaakkois-Suomen ammattikorkeakoulu",
    "polamk": "Poliisiammattikorkeakoulu",
    "hå": "Högskolan på Åland",
}


def render_course(id, title, text_content, metadata):
    return {
        'id': id,
        'texts': {
            'content': text_content
        },
        'metadata': {
            'title': title,
            'credits': format_credits(metadata['credits']),
        }
    }

def render_degree(title, text_content, url, metadata):
    field = metadata.get('field')

    raw_school = metadata.get('school')
    school_shorthand = SCHOOL_SHORTHANDS.get(raw_school) or raw_school
    school_alias = SCHOOL_ALIASES.get(raw_school)

    if school_alias:
        organizaer_alises = [school_alias]
    else:
        organizaer_alises = []

    return {
        'title': title,
        'url': url,
        'credits': format_credits(metadata['credits']),
        'field': FIELD_ALIASES.get(field) or field,
        'degrees': metadata.get('degrees'),
        'level': metadata.get('level') or 'AMK', # TODO: HAMK levels are missing
        'organizers': [school_shorthand],
        'organizer_aliases': organizaer_alises,
        'description': text_content,
    }


def process_amk(cur):
    degrees_courses = {} # {degree_id: [course_ids]}
    cur.execute(f"SELECT id, metadata FROM content WHERE source_type='degree-course'")
    for id, metadata in cur:
        degree_id = metadata['degree_id']
        course_id = metadata['course_id']
        degrees_courses.setdefault(degree_id, []).append(course_id)

    print(f"Writing AMK degree-course mapping to amk-courses.json")
    with open('amk-courses.json', 'w') as f:
        f.write(ujson.dumps(degrees_courses, ensure_ascii=False, escape_forward_slashes=False, indent=2))

    print(f"Writing course data to amk_courses.ndjson")
    with open('amk_courses.ndjson', 'w') as output_file:
        cur.execute(f"SELECT id, source_name, title, url, text_content, metadata FROM content WHERE source_type='course'")
        for id, source_name, title, url, text_content, metadata in cur:
            output_file.write(ujson.dumps(render_course(id,title,text_content,metadata), ensure_ascii=False, escape_forward_slashes=False))
            output_file.write('\n')

    print(f"Writing degree data to amk_degrees.ndjson")
    print(f"Uploading degrees")
    counter = 0
    with open('amk_degrees.ndjson', 'w') as output_file:
        cur.execute(f"SELECT id, source_name, title, text_content, url, metadata FROM content WHERE source_type='degree'")
        #for id in degree_organizer.keys():
        for id, source_name, title, text_content, url, metadata in cur:
            json = render_degree(title, text_content, url, metadata)
            output_file.write(ujson.dumps(json, ensure_ascii=False, escape_forward_slashes=False, indent=2))
            output_file.write('\n')
            upload_one(f"/formal_degrees/{id}", json)
            counter += 1
            if counter % 100 == 0:
                print(counter)


if __name__ == '__main__':
    with psycopg.connect(DB_CONNECTION) as conn:
        with conn.cursor() as cur:
            process_amk(cur)
