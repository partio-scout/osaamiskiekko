import os
import time
import ujson
import requests
import random
from pymongo import MongoClient
from bson.objectid import ObjectId

from parser_utils import load_set

BACKEND_API_URLS = [
    #'http://localhost:3000/api/v1',
    'https://osaamiskiekko.vxt-research.com/api/v1'
]
API_KEY = os.environ['API_KEY']

MATCHING_SUB_COURSES_COUNT = 5
MATCHING_SUB_COURSE_MIN_SCORE = 2
MATCHING_SUB_COURSE_MIN_KEYWORDS = 2

def upload_hobby_matches(id, results, match_count):
    for api_url in BACKEND_API_URLS:
        url = f"{api_url}/hobby_courses/{id}/matches?api_key={API_KEY}"
        response = upload(url, { 'matches': results, 'match_count': match_count })


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


def compute_scores(formal_keywords, hobby_courses, whitelisted_keywords):
    keyword_scores = {} # { hobby_course_id: {keyword: score} }

    for hobby_course_id, hobby_keywords in hobby_courses.items():
        strong_keyword_count = 0
        scores = {} # { keyword: score }

        for formal_keyword, formal_freq in formal_keywords.items():
            hobby_freq = hobby_keywords.get(formal_keyword)
            if not hobby_freq:
                continue

            scores[formal_keyword] = scores.get(formal_keyword, 0) + formal_freq + hobby_freq

        if strong_keyword_count > 0 or len(scores) > 1: # Ignore matches with only one generic keyword
            keyword_scores[hobby_course_id] = scores

    return keyword_scores


def load_keywords(db_keywords):
    return {
        db_keyword['keyword']: db_keyword['freq']
        for db_keyword in db_keywords
    }


def calculate_course_matches(db, hobby_course, formal_courses, whitelisted_keywords):
    # Matching is symmetric at this level, so this covers both ways
    print("Calculate course matches")

    # Load hobby courses to memory
    hobby_keywords = {}
    for course in db.hobby_course_keywords.find({'_id': {'$in': list(hobby_courses.keys())}}):
        hobby_keywords[course['_id']] = load_keywords(course['keywords'])

    counter = 0
    for formal_course in db.formal_course_keywords.find({'_id': {'$in': list(formal_courses.keys())}}):
        formal_course_id = formal_course['_id']
        formal_keywords = load_keywords(formal_course['keywords'])

        keyword_scores = compute_scores(formal_keywords, hobby_keywords, whitelisted_keywords)

        for hobby_course_id, scores in keyword_scores.items():
            if len(scores) == 0:
                continue

            db.course_matches.insert_one({
                '_id': f"{hobby_course_id}|{formal_course_id}", # FIXME
                'scores': scores
            })

        counter += 1
        if counter % 1000 == 0:
            print(counter)


def calculate_degree_matches(db, hobby_courses, formal_courses, degrees_courses, whitelisted_keywords):
    print(f"Calculate formal degree matches")
    degree_count = len(degrees_courses)
    degree_counter = 0

    for degree_id, formal_course_ids in degrees_courses.items():
        results = []
        max_match_score = 0
        for hobby_course_id, hobby_course_metadata in hobby_courses.items():
            hobby_result_scores = {} # keyword => freq
            matching_courses = []
            course_max_match_score = 0

            match_ids = [f"{hobby_course_id}|{formal_course_id}" for formal_course_id in formal_course_ids]
            for match in db.course_matches.find({'_id': {'$in': match_ids}}):
                parts = match['_id'].split('|')
                hobby_course_id = parts[0]
                formal_course_id = parts[1]

                match_score = 0
                for keyword, freq in match['scores'].items():
                    is_ngram = ' ' in keyword
                    if is_ngram or keyword in whitelisted_keywords:
                        weight = 1
                    else:
                        weight = 0.5

                    hobby_result_scores[keyword] = hobby_result_scores.get(keyword, 0) + weight
                    match_score += weight # Match score is simply the number of matching keywords (weighted)

                if match_score > max_match_score:
                    max_match_score = match_score

                if match_score > course_max_match_score:
                    course_max_match_score = match_score

                formal_course = formal_courses.get(formal_course_id)
                if formal_course:
                    formal_course_name = formal_course[0]
                    formal_course_credits = formal_course[1]

                    if formal_course_credits:
                        formal_course_name = f"{formal_course_name} ({formal_course_credits})"

                    matching_courses.append((formal_course_name, match_score))
                else:
                    print(f"WARNING: {formal_course_id} not found")

            if course_max_match_score < 1:
                continue

            filtered_matching_courses = []
            for name, score in sorted(matching_courses, key=lambda tup: tup[1], reverse=True)[:MATCHING_SUB_COURSES_COUNT]:
                filtered_matching_courses.append(name) # Always include at least one

            # Upload hobby results
            tuples = sorted(hobby_result_scores.items(), key=lambda tup: tup[1], reverse=True)
            keywords = []
            #total_score = 0
            for keyword, freq in tuples:
                keywords.append(keyword.replace('#', ''))

            results.append({
                "result_id": hobby_course_id,
                "similarity": max_match_score,
                "keywords": keywords,
                "matching_courses": filtered_matching_courses,
            })

        sorted_results = sorted(results, key=lambda result: result['similarity'], reverse=True)

        # Decide where to cut off the results
        final_result_count = len(sorted_results)
        for index, result in enumerate(sorted_results):
            # After 20 results, exclude poor results
            if index >= 20 and result['similarity'] <= 1:
                final_result_count = index + 1
                break

        upload_formal_matches(degree_id, sorted_results[:final_result_count], len(sorted_results))
        degree_counter += 1
        if degree_counter % 50 == 0:
            print(f"{degree_counter} / {degree_count}")


def calculate_hobby_matches(db, hobby_courses, formal_courses, degrees_courses, whitelisted_keywords):
    # hobby_courses: {hobby_course_id: metadata}
    # formal_courses: {formal_course_id: metadata}
    # degrees_courses: {degree_id: [course_ids]}
    print("Calculate hobby course matches")
    hobby_course_count = len(hobby_courses)
    course_counter = 0

    for hobby_course_id in hobby_courses.keys():
        degree_results = []
        max_match_score = 0
        for formal_degree_id in degrees_courses.keys():
            degree_scores = {}
            matching_courses = []
            course_max_match_score = 0

            match_ids = [f"{hobby_course_id}|{formal_course_id}" for formal_course_id in degrees_courses[formal_degree_id]]

            for match in db.course_matches.find({'_id': {'$in': match_ids}}):
                parts = match['_id'].split('|')
                hobby_course_id = parts[0]
                formal_course_id = parts[1]

                match_score = 0
                for keyword, freq in match['scores'].items():
                    is_ngram = ' ' in keyword
                    if is_ngram or keyword in whitelisted_keywords:
                        weight = 1
                    else:
                        weight = 0.5

                    degree_scores[keyword] = degree_scores.get(keyword, 0) + weight
                    match_score += weight

                if match_score > max_match_score:
                    max_match_score = match_score

                if match_score > course_max_match_score:
                    course_max_match_score = match_score

                formal_course = formal_courses.get(formal_course_id)
                if formal_course:
                    formal_course_name = formal_course[0]
                    formal_course_credits = formal_course[1]

                    if formal_course_credits:
                        formal_course_name = f"{formal_course_name} ({formal_course_credits})"

                    matching_courses.append((formal_course_name, match_score))
                else:
                    print(f"WARNING: {formal_course_id} not found")

            if course_max_match_score < 1:
                continue

            filtered_matching_courses = []

            for name, score in sorted(matching_courses, key=lambda tup: tup[1], reverse=True)[:MATCHING_SUB_COURSES_COUNT]:
                filtered_matching_courses.append(name) # Always include at least one

            tuples = sorted(degree_scores.items(), key=lambda tup: tup[1], reverse=True)
            keywords = []
            total_score = 0
            for keyword, freq in tuples:
                keywords.append(keyword.replace('#', ''))

            degree_results.append({
                "result_id": formal_degree_id,
                "similarity": max_match_score,
                "keywords": keywords,
                "matching_courses": filtered_matching_courses,
            })

        # Shuffle the results
        # Otherwise in case of ties, Lukio will always be under AMK, and there are lots and lots of ties with score=2.
        random.shuffle(degree_results)

        sorted_results = sorted(degree_results, key=lambda result: result['similarity'], reverse=True)

        # Decide where to cut off the results
        final_result_count = len(sorted_results)
        for index, result in enumerate(sorted_results):
            # After 20 results, exclude poor results
            if index >= 20 and result['similarity'] <= 1:
                final_result_count = index + 1
                break

        upload_hobby_matches(hobby_course_id, sorted_results[:final_result_count], final_result_count)

        course_counter += 1
        if course_counter % 20 == 0:
            print(f"{course_counter} / {hobby_course_count}")


def load_courses(filename):
    courses = {}

    with open(filename) as f:
        for line in f:
            json = ujson.loads(line)
            courses[json['id']] = (json['metadata']['title'], json['metadata']['credits'])

    return courses


def init_db():
    db_host = 'localhost'
    db_name = 'osaamiskiekko'
    client = MongoClient(db_host, 27017)
    db = client[db_name]
    return db


if __name__ == '__main__':
    db = init_db()

    whitelisted_keywords = load_set('rules/whitelist.txt')

    # Load course metadata
    hobby_courses = load_courses('hobby_courses.ndjson')
    formal_courses = load_courses('formal_courses.ndjson')
    formal_courses.update(load_courses('amk_courses.ndjson'))
    formal_courses.update(load_courses('lukio_courses.ndjson'))

    courses_degrees = {} # {course_id: [degree_ids]}
    degrees_courses = {} # {degree_id: [course_ids]}

    # Load course-degree mappings
    with open('amk-courses.json') as f:
        degrees_courses.update(ujson.loads(f.read()))

    with open('formal-degrees-courses.json') as f:
        degrees_courses.update(ujson.loads(f.read()))

    with open('lukio-courses.json') as f:
        degrees_courses.update(ujson.loads(f.read()))

    db.course_matches.delete_many({})
    calculate_course_matches(db, hobby_courses, formal_courses, whitelisted_keywords)

    calculate_degree_matches(db, hobby_courses, formal_courses, degrees_courses, whitelisted_keywords)

    calculate_hobby_matches(db, hobby_courses, formal_courses, degrees_courses, whitelisted_keywords)
