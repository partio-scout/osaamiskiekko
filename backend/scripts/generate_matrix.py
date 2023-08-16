import os
import logging
import time
import ujson
import urllib.parse
import requests
from collections import Counter, namedtuple

from providence.utils.http_utils import read_remote
from providence.utils.progress_indicator import ProgressIndicator

SEARCH_API_URL = 'http://localhost'
DATA_SERVER_URL = 'http://localhost:8001'
BACKEND_API_URLS = [
    #'http://localhost:3000/api/v1',
    "https://osaamiskiekko.vxt-research.com/api/v1"
]
API_KEY = os.environ['API_KEY']

MAX_MATCH_COUNT = 50


def read_json(url):
    data = read_remote(url, max_attempt_count=1, log=False)
    json = ujson.loads(data)
    return json


def fetch_ids(data_type):
    url = f'{DATA_SERVER_URL}/document_original_ids/{data_type}'

    data = read_remote(url, max_attempt_count=1, log=False).decode('utf-8').strip()
    ids = data.split('\n')

    return ids


def fetch_document(data_type, doc_id, query_data=''):
    escaped_query_data = urllib.parse.quote_plus(ujson.dumps(query_data))

    url = f'{SEARCH_API_URL}/documents/{data_type}/{doc_id}?query_data={query_data}'
    json = read_json(url)
    #print(ujson.dumps(json, indent=2))

    return json


class FormalDegreeResult(object):
    def __init__(self, degree_id):
        self.degree_id = degree_id
        self.courses = []
        self.similarity = None
        self.keywords = []

    def calculate_similarity(self):
        self.similarity = max(course['similarity'] for course in self.courses)

        # Keep the most common keywords
        keywords = {} # keyword, freq
        for course in self.courses:
            #similarity_sum += course['similarity']
            for keyword in course['keywords']:
                keywords[keyword] = keywords.get(keyword, 0) + 1

        # Sort the courses by similarity because we'll only keep the top n
        self.courses = sorted(self.courses, key=lambda course: course['similarity'], reverse=True)

        sorted_keywords = sorted(keywords.items(), key=lambda item: item[1], reverse=True)
        self.keywords = [keyword for keyword, freq in sorted_keywords[0:5]]


def search_by_sivis(search_for_datatype, degrees, id, courses_degrees, similarity_threshold, n, term_freqs):
    print(f"Search by {id}")
    search_by_datatype = 'sivis'

    # NOTE: n needs to be quite high. Otherwise it can happen that all of the top n results belong to the same degree

    url = f'{SEARCH_API_URL}/search/{search_for_datatype}?id={id}&type={search_by_datatype}&limit={n}'
    json = read_json(url)

    query_data = ','.join([str(item) for item in json['query_data']])
    summary_docs = json['results'][search_for_datatype]

    # Fetch details of the retrieved documents
    for doc in summary_docs:
        #if doc['similarity'] < similarity_threshold:
        #    continue

        course_id = doc['id']
        full_doc = fetch_document(search_for_datatype, course_id, query_data)

        for degree_id in courses_degrees.get(course_id, []):
            json = {
                'title': doc['metadata']['title'],
                'credits': doc['metadata'].get('credits'),
                'similarity': doc['similarity'],
                'keywords': full_doc['match']['associated_terms'],
            }

            degree = degrees.setdefault(degree_id, FormalDegreeResult(degree_id))
            degree.courses.append(json)

        # Update term feqs
        terms = {
            term: 1
            for term in full_doc['match']['associated_terms']
        }
        term_freqs.update(terms)


def search_by_formal(search_by_datatype, formal_degree_id, course_ids, similarity_threshold, term_freqs):
    search_for_datatype = 'sivis'
    n = 5

    hobby_matches = {} # hobby_course_id => HobbyMatch

    # Execute a search with every course in the degree, keep the best matches
    for search_by_id in course_ids:
        # Fetch metadata of the query document
        try:
            formal_search_doc = fetch_document(search_by_datatype, search_by_id)
        except Exception as e:
            continue

        formal_course_title = formal_search_doc['metadata']['title']
        #print(f"Search by {search_by_id} {formal_course_title}")

        # Execute search
        url = f'{SEARCH_API_URL}/search/{search_for_datatype}?id={search_by_id}&type={search_by_datatype}&limit={n}'
        json = read_json(url)

        result_summaries = json['results'][search_for_datatype]
        query_data = ','.join([str(item) for item in json['query_data']])

        # Fetch details of the retrieved documents
        for hobby_result_summary in result_summaries:
            hobby_course_id = hobby_result_summary['id']
            similarity = hobby_result_summary['similarity']
            #if similarity < similarity_threshold:
            #    continue

            # Fetch the detailed document
            hobby_result_full = fetch_document(search_for_datatype, hobby_result_summary['id'], query_data)

            # Collect matching courses
            match = hobby_matches.setdefault(hobby_course_id, HobbyMatch(hobby_course_id))
            match.matching_formal_courses[formal_course_title] = similarity
            match.add_keywords(hobby_result_full['match']['associated_terms'])

            # Update term feqs
            terms = {
                term: 1
                for term in hobby_result_full['match']['associated_terms']
            }
            term_freqs.update(terms)

    for course_id, match in hobby_matches.items():
        match.calculate_similarity()

    # Sort hobby matches
    sorted_matches = sorted(hobby_matches.values(), key=lambda match: match.similarity, reverse=True)

    results = [
        {
            "result_id": match.course_id,
            "similarity": match.similarity,
            "keywords": match.keywords,
            "matching_courses": match.courses[:10],
        }
        for match in sorted_matches
    ]

    if not results:
        return

    if results[0]['similarity'] >= similarity_threshold:
        # If there's at least one match above the threshold, keep only good matches
        final_results = [result for result in results if result['similarity'] >= similarity_threshold]
        match_count = len(final_results)
    else:
        # If there are only poor matches, keep only one
        final_results = results[:1]
        match_count = 0

    upload_formal_matches(formal_degree_id, results[:MAX_MATCH_COUNT], match_count)


class HobbyMatch(object):
    def __init__(self, course_id):
        self.course_id = course_id
        self.similarity = None
        self.matching_formal_courses = {} # title => similarity
        self.keyword_counter = {} # keyword: freq

    def add_keywords(self, keywords):
        for keyword in keywords:
            self.keyword_counter[keyword] = self.keyword_counter.get(keyword, 0) + 1

    def calculate_similarity(self):
        # Keep the most common keywords
        sorted_keywords = sorted(self.keyword_counter.items(), key=lambda item: item[1], reverse=True)
        self.keywords = [keyword for keyword, freq in sorted_keywords[0:5]]

        # Sort the courses by similarity
        matches = sorted(self.matching_formal_courses.items(), key=lambda m: m[1], reverse=True)

        # Total similarity is the best match (max)
        if matches:
            self.similarity = matches[0][1]
        else:
            self.similarity = 0

        self.courses = [title for title, similarity in matches]


def upload_hobby_matches(id, results, match_count):
    for api_url in BACKEND_API_URLS:
        url = f"{api_url}/hobby_courses/{id}/matches?api_key={API_KEY}"
        response = upload(url, { 'matches': results, 'match_count': match_count }) # TODO: add match_count support to backend


def upload_formal_matches(id, results, match_count):
    for api_url in BACKEND_API_URLS:
        url = f"{api_url}/formal_degrees/{id}/matches?api_key={API_KEY}"
        response = upload(url, { 'matches': results, 'match_count': match_count })


def upload(url, payload):
    while True:
        try:
            response = requests.post(url, json=payload)

            if response.status_code != 200:
                raise Exception(f"Upload failed\nPOST {url}\nStatus code: {response.status_code}\n{response.text}")

            return response
        except Exception as e:
            print(e)

        print("Retrying in 60 s")
        time.sleep(60)


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG, format='%(name)s %(asctime)s : %(levelname)s : %(message)s')
    logging.getLogger('urllib3.connectionpool').setLevel(logging.ERROR)
    enable_amk = True
    enable_eperusteet = True
    enable_sivis = True

    term_freqs = Counter()
    similarity_threshold = 0.55
    time_limit = None

    # Load course-degree mappings
    with open('amk-courses.json') as f:
        degrees_courses = ujson.loads(f.read())
        amk_courses_degrees = {} # {course_id: [degree_ids]}
        for degree_id, course_ids in degrees_courses.items():
            for course_id in course_ids:
                amk_courses_degrees.setdefault(course_id, []).append(degree_id)

    with open('formal-degrees-courses.json') as f:
        degrees_courses = ujson.loads(f.read())
        eperusteet_courses_degrees = {} # {course_id: [degree_ids]}
        for degree_id, course_ids in degrees_courses.items():
            for course_id in course_ids:
                eperusteet_courses_degrees.setdefault(course_id, []).append(degree_id)

    if enable_sivis:
        ids = list(reversed(fetch_ids('sivis')))
        print(f"Search by {len(ids)} sivis courses")
        #original_ids = ['4254204', '4330744', '4330747', '3085238', '4014870', '3751972', '3755638', '2843353', '3748554', '3821247', '2583193', '4014871', '4015117', '4161689', '3704221', '3748556', '3885389', '3264986', '3273157', '3890472', '4017621', '4244475', '4354902']
        #ids = [
            #f"eperusteet-hobby-course-{id}"
            #for id in original_ids
        #]

        # Search the other data type with these IDs
        skip_mode = False
        skip_counter = 0
        progress = ProgressIndicator(len(ids))
        time_start = time.time()
        for id in ids:
            #if id == 'eperusteet-hobby-course-2607199':
                #print(f"Skipped {skip_counter}")
                #progress = ProgressIndicator(len(ids) - skip_counter)
                #skip_mode = False

            if skip_mode:
                skip_counter += 1
                continue

            degrees = {}
            search_by_sivis('eperusteet', degrees, id, eperusteet_courses_degrees, similarity_threshold, 50, term_freqs)
            search_by_sivis('amk', degrees, id, amk_courses_degrees, similarity_threshold, 50, term_freqs)

            for degree_id, degree in degrees.items():
                degree.calculate_similarity()

            # Sort by similarity
            results = [
                {
                    "result_id": degree.degree_id,
                    "similarity": degree.similarity,
                    "keywords": degree.keywords,
                    "matching_courses": [course["title"] for course in degree.courses[:10]],
                }
                for degree in sorted(degrees.values(), key=lambda degree: degree.similarity, reverse=True)
            ]

            if results:
                if results[0]['similarity'] >= similarity_threshold:
                    # If there's at least one match above the threshold, keep only good matches
                    final_results = [result for result in results if result['similarity'] >= similarity_threshold]
                    match_count = len(final_results)
                else:
                    # If there are only poor matches, keep only one
                    final_results = results[:1]
                    match_count = 0

                #print(ujson.dumps(final_results, indent=2, ensure_ascii=False))
                upload_hobby_matches(id, results[:MAX_MATCH_COUNT], match_count)

            progress.log()
            if time_limit and (time.time() - time_start > time_limit):
                print("Time limit reached")
                break

    if enable_eperusteet:
        print('Search by ePerusteet')
        with open('formal-degrees-courses.json') as f:
            degrees = ujson.loads(f.read()) # {degree_id: [course_ids]}

        progress = ProgressIndicator(len(degrees))
        time_start = time.time()
        for degree_id, course_ids in degrees.items():
            # Search the other data type with these IDs
            search_by_formal('eperusteet', degree_id, course_ids, similarity_threshold, term_freqs)
            progress.log()

            if time_limit and (time.time() - time_start > time_limit):
                print("Time limit reached")
                break

    if enable_amk:
        print('Search by AMK')
        with open('amk-courses.json') as f:
            degrees = ujson.loads(f.read()) # {degree_id: [course_ids]}

        progress = ProgressIndicator(len(degrees))
        time_start = time.time()
        for degree_id, course_ids in degrees.items():
            # Search the other data type with these IDs
            search_by_formal('amk', degree_id, course_ids, similarity_threshold, term_freqs)
            progress.log()

            if time_limit and (time.time() - time_start > time_limit):
                print("Time limit reached")
                break


    # Load keywords which have already been whitelisted, so that they are not printed again
    keywords_whitelist = set()
    with open('keywords-whitelist.txt') as f:
        for line in f:
            keywords_whitelist.add(line.strip())

    # Print most common terms
    with open('keywords.txt', 'w') as f:
        for term, freq in term_freqs.most_common(1000):
            if term in keywords_whitelist:
                continue

            f.write(f'{freq}\t{term}\n')
