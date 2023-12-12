Overview
========

This service provides a search engine for finding similar courses from non-formal and formal education.
Data about high school, vocational and non-formal courses are loaded from ePerusteet, while data from polytechnics must be provided as a data dump.

Matching is performed offline using Python scripts, and the precomputed matches are uploaded to a server. The server contains a REST API implemented in Rust, backed by MongoDB.


Preprocessing the data
======================

Data is meant to be processed locally e.g. once per year as a manual step, and the matching results are uploaded to the server. For starting the server, see sections below.

Install Turku-neural-parser-pipeline from https://github.com/TurkuNLP/Turku-neural-parser-pipeline (hint: use Python 3.9)

Run load\_eperusteet.py. It reads from ePerusteet API and populates directories ammatilliset-courses, ammatilliset-organizers, amosaa-courses

    python scripts/load_eperusteet.py

Run load_fields.py. It scrapes field names from oph.fi and writes fields.json

    python scripts/load_fields.py

Run process\_amk.py. It reads AMK course descriptions from a local PostgreSQL database and writes amk-courses.json, amk\_courses.ndjson, amk\_degrees.ndjson. Obtaining AMK course descriptions is outside of the scope of this package. They have been obtained by scraping the websites of the schools, and because the websites change regularly, this step cannot be automated.

    python scripts/process_amk.py

Run process\_eperusteet.py. It preprocesses ePerusteet data, uploads course descriptions to the server, and generates formal\_courses.ndjson, formal-degrees-courses.json, hobby\_courses.ndjson, lukio\_courses.ndjson, lukio-courses.json

    API_KEY=... python scripts/process_eperusteet.py

Run parse.py. It lemmatizes course descriptions and stores the results in a local MongoDB database.
Turku-neural-parser-pipeline must be running locally and listening on port 7689.

    python scripts/parse.py

Run matching.py. It finds connections between courses by looking for similar keywords, and uploads the results to the server.

    API_KEY=... python scripts/matching.py


API backend
===========

To start locally:

    cargo run --bin api

To start on the server, see Dockerfile.

Set the following environment variables if necessary:

    - MONGO_HOST (default 127.0.0.1)
    - MONGO_DB (database name, default osaamiskiekko)
    - API_KEY

Backend is listening on port 3000.


API for uploading data
======================

NOTE: These endpoints require an API key as query parameter, e.g. /formal\_degrees/12345?api\_key=hunter2

Send JSON payload in request body.

Upload formal degree: POST /formal_degrees/:id

    {
        'title': "Name of the degree",
        'description': "Description of the degree",
        'credits': 5,
        'field': FIELD_ALIASES.get(self.field) or self.field,
        'level': "e.g. Lukio",
        'degrees': ["Names of degrees", "e.g. muotoilija (amk)"],
        'url': "Link to the original web site",
        'organizers': ["List of organizers", "e.g. Xamk"],
        'organizer_aliases': ["Alternative names for organizers", "e.g. Kaakkois-Suomen ammattikorkeakoulu"]
    }

Upload formal degree matches: POST /formal_degrees/:id/matches

    [
        {
            "result_id": ID of the matching non-formal course,
            "similarity": similarity score,
            "keywords": ["list of keywords to be shown to user"],
            "matching_courses": ["list of course names to be shown to user"]
        },
        ...
    ]

Upload non-formal course: POST /hobby_courses/:id

    {
        'title': "Name of the course",
        'description': "Description of the course",
        'credits': 5,
        'field': ["e.g. Tekniikka ja liikenne"],
        'organization_id': "e.g. 2280370",
        'organization_name': "e.g. Opintokeskus Sivis",
        'url': "Link to the original web site"
    }

Upload non-formal course matches: POST /hobby_courses/:id/matches

    [
        {
            "result_id": ID of the matching degree,
            "similarity": similarity score,
            "keywords": ["list of keywords to be shown to user"],
            "matching_courses": ["list of course names to be shown to user"]
        },
        ...
    ]

DELETE is supported for the following:

    /formal_degrees/:id
    /hobby_courses/:id


Query API
=========

NOTE: These endpoints don't require an API key.

List formal degrees: GET /formal

    [
        {
            "id":"5cfcdf619fe26a4621efd5ad6156d2de",
            "field": {"fi":"Matkailu, ravitsemus ja talous"},
            "level":{"fi":"AMK"},
            "name":{"fi":"Restonomikoulutus"},
            "degrees":{"fi":["Restonomi (AMK), matkailuala"]},
            "credits":"210 op",
            "organizations_count":1,
            "organizations":["Lapin AMK"],
            "organization_aliases":["Lapin ammattikorkeakoulu"],
            "url":"https://opinto-opas-amk.peppi.lapit.csc.fi/708/fi/94/4083",
            "match_count":52,  # Number of matching non-formal courses
            "best_match":7.0   # Score of the best match, for sorting
        },
        ...
    ]

Show formal degree: GET /formal/:degree_id

    {
        "id":"5cfcdf619fe26a4621efd5ad6156d2de",
        "field":{"fi":"Matkailu, ravitsemus ja talous"},
        "level":{"fi":"AMK"},
        "name":{"fi":"Restonomikoulutus"},
        "degrees":{"fi":["Restonomi (AMK), matkailuala"]},
        "credits":"210 op",
        "organizations_count":1,
        "organizations":["Lapin AMK"],
        "organization_aliases":["Lapin ammattikorkeakoulu"],
        "url":"https://opinto-opas-amk.peppi.lapit.csc.fi/708/fi/94/4083",
        "match_count":52,
        "best_match":7.0
    }

List formal degree matches: GET /formal/:degree_id/matches

    [
        {
            "id":"eperusteet-hobby-course-4364924",
            "name":{"fi":"Työsuojelun peruskurssi"},
            "credits":"2 op",
            "organization":"Työväen sivistysliitto TSL ry:n opintokeskus",
            "description":{"fi": "Description"},
            "url":"https://eperusteet.opintopolku.fi/#/fi/toteutussuunnitelma/4362801/vapaasivistystyo/sisalto/4364924",
            "tutkinnonosat":["Työelämän turvallisuusosaaminen (5 op)","Matkailualan turvallisuusosaaminen (5 op)"],  # List of matching degree parts to explain the match
            "keywords":["työsuojelu","työturvallisuus"] # List of matching keywords to explain the match
        },
        ...
    ]

Show formal degree match: GET /formal/:degree\_id/matches/:course\_id

    {
        "id":"eperusteet-hobby-course-4364924",
        "name":{"fi":"Työsuojelun peruskurssi"},
        "tutkinnonosat":["Työelämän turvallisuusosaaminen (5 op)","Matkailualan turvallisuusosaaminen (5 op)"],
        "keywords":["työsuojelu","työturvallisuus"]
    }

List non-formal courses: GET /vst

    [
        {
            "id":"eperusteet-hobby-course-4364924",
            "name":{"fi":"Työsuojelun peruskurssi"},
            "credits":"2 op",
            "organization":"Työväen sivistysliitto TSL ry:n opintokeskus",
            "url":"https://eperusteet.opintopolku.fi/#/fi/toteutussuunnitelma/4362801/vapaasivistystyo/sisalto/4364924",
            "match_count":254,  # Number of matching formal courses
            "best_match":7.0    # Score of the best match, for sorting
        }
    ]


Show non-formal course: GET /vst/:course_id

    {
        "id":"eperusteet-hobby-course-4364924",
        "name":{"fi":"Työsuojelun peruskurssi"},
        "description":{"fi":"Description"},
        "credits":"2 op",
        "organization":"Työväen sivistysliitto TSL ry:n opintokeskus",
        "url":"https://eperusteet.opintopolku.fi/#/fi/toteutussuunnitelma/4362801/vapaasivistystyo/sisalto/4364924",
        "match_count":254,
        "best_match":7.0
    }

List non-formal course matches: GET /vst/:course_id/matches

    [
        {
            "id":"eperusteet-degree-4454271",
            "name":{"fi":"Eläintenhoidon erikoisammattitutkinto"},
            "field":{"fi":"Maatalous, luonto ja ympäristö"},
            "level":{"fi":"Erikoisammattitutkinto"},
            "degrees":{"fi":["Eläintenkouluttaja (EAT)","Klinikkaeläinhoitaja (EAT)","Koe-eläinhoitaja (EAT)"]},
            "description":{"fi":"Description"},
            "credits":"180 op",
            "organizations_count":0,
            "organizations":[],
            "url":"https://eperusteet.opintopolku.fi/#/fi/kooste/ammatillinen/4454271",
            "tutkinnonosat":["Eläintarhaeläinten hoidon suunnittelu (80 op)","Eläinten ongelmakäytöksen hoito ja käytösneuvonta (80 op)"], # List of matching degree parts to explain the match
            "keywords":["työhyvinvointi","hyvinvointi","työturvallisuus"]  # List of matching keywords to explain the match
        },
        ...
    ]

Show non-formal course match: GET /vst/:course\_id/matches/:degree\_id

    {
        "id":"eperusteet-degree-4454271",
        "name":{"fi":"Eläintenhoidon erikoisammattitutkinto"},
        "tutkinnonosat":["Eläintarhaeläinten hoidon suunnittelu (80 op)","Eläinten ongelmakäytöksen hoito ja käytösneuvonta (80 op)"],
        "keywords":["työhyvinvointi","hyvinvointi","työturvallisuus"]
    }
