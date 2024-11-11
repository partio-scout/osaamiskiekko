import requests
import ujson
import re
from pymongo import MongoClient
from bson.objectid import ObjectId
from parser_utils import *

SCORE_NGRAM = 1
SCORE_WORD_WHITELISTED = 1
SCORE_WORD_GENERIC = 0.2

LETTERS = r'A-Za-z\u00c0-\u00d6\u00d8-\u00f6\u00f8-\u00ff'
UPPERCASE_LETTERS = r'A-Z\u00c0-\u00d6\u00d8-\u00de'
LOWERCASE_LETTERS = r'a-z\u00f8-\u00ff'
PUNCTUATION = r'.?!:"\u2013\u2014' # u2013=ndash  u2014=mdash

# Sentence splitting rules
# Preceeded by punctuation (. ? !) and space, not immediately preceeded by a dot (J. L. Roneberg case) Followed by capital letter
RE_CAPITAL = '(?<=[^.].[{punctuation}])\s+(?=[{uppercase}])'.format(uppercase=UPPERCASE_LETTERS, punctuation=PUNCTUATION)

RE_ELLIPSIS = '(?<=[^.][{punctuation}]{{3}})\s+(?=[{uppercase}])'.format(uppercase=UPPERCASE_LETTERS, punctuation=PUNCTUATION)

# For lists, match newline followed by anything but a lowercase letter
RE_LISTS = '\n(?=[^{letters}])'.format(letters=LOWERCASE_LETTERS)

QUOTES = r'"\u201c\u201d'
RE_QUOTES = '(?<!^)[{quote}](?=[{uppercase}])'.format(quote=QUOTES, uppercase=UPPERCASE_LETTERS)

SENTENCE_SEPARATOR = re.compile(r'({}|{}|{}|{})'.format(RE_CAPITAL, RE_ELLIPSIS, RE_LISTS, RE_QUOTES), re.UNICODE)

PARSER_URL='http://localhost:7689'
HEADERS = {"Content-Type": "text/plain; charset=utf-8"}

DEBUG_SENTENCE = None
DEBUG_DOCUMENT = None


def pick_consecutive_verbs(tokens):
    is_match = False
    index = 0
    length = len(tokens)
    phrases = []
    while index < length - 1:
        token = tokens[index]

        if token.category == 'VERB' and token.verbform == 'Fin':
            next_token = tokens[index + 1]
            if next_token.category == 'VERB':
                phrases.append(f"{token.original} {next_token.original}")

        index += 1

    return phrases


def extract_noun_phrase(tokens, index, whitelist=None, blacklist=None):
    # If a set of blacklisted lemmas is given, phrases containing the blacklisted lemmas are skipped.
    # If a set of qhitelisted lemmas is given, only phrases containing the whitelisted lemmas are kept.
    #
    # The first token at tokens[index] can be anything (verb, noun, etc.), but the following words must be nouns or adjectives.
    #
    # Picks up sequences like
    # VERB verbform=Inf
    # NOUN
    # (Ignores ADJ in the middle)
    # NOUN
    # NOUN ...
    #
    # Example:
    # VERB(Inf) kasvattaa
    # ADJ       yleisimpiä
    # NOUN      satokasveja
    # NOUN      viljelylaatikossa

    contains_whitelisted = False
    length = len(tokens)
    token = tokens[index]
    phrase = token.original
    lemmatized_phrase = token.lemma
    phrase_length = 1
    index += 1

    if whitelist is not None and token.lemma in whitelist:
        contains_whitelisted = True

    if blacklist is not None and token.lemma in blacklist:
        return None

    # Find the following nouns (ignore adjectives)
    while index < length:
        token = tokens[index]

        if whitelist is not None and token.lemma in whitelist:
            contains_whitelisted = True

        if blacklist is not None and token.lemma in blacklist:
            return None

        if token.category != 'NOUN' and token.category != 'ADJ':
            break

        if token.category == 'NOUN':
            lemmatized_phrase += ' ' + token.lemma
            phrase += ' ' + token.original
            phrase_length += 1

        index += 1

    if phrase_length < 2:
        return None

    if whitelist is not None and contains_whitelisted is False:
        return None

    return phrase, lemmatized_phrase


def parse_sentence(tokens, whitelist=None, blacklist=None):
    # blacklist: set of lemmas
    # qwitelist: set of lemmas
    index = 0
    length = len(tokens)
    result = []

    while index < length:
        token = tokens[index]

        if token.category == 'VERB' and token.verbform == 'Inf':
            # A verb alone is never interesting (e.g. huoltaa), it has to go with something.
            # Consecutive verbs are generally not interesting in this domain (e.g. osaa hyödyntää).
            tup = extract_noun_phrase(tokens, index, whitelist=whitelist, blacklist=blacklist)
            if tup:
                phrase, lemmatized_phrase = tup
                result.append(lemmatized_phrase)

        if token.category == 'NOUN':
            tup = extract_noun_phrase(tokens, index, whitelist=whitelist, blacklist=blacklist)
            if tup:
                phrase, lemmatized_phrase = tup
                result.append(lemmatized_phrase)

        index += 1

    return result


class Parser(object):
    def __init__(self):
        self.init_db()
        self.load_wordlists()

        self.phrase_freqs = {}
        self.phrases = []
        self.moods = set()
        self.nouncases = set()


    def init_db(self):
        db_host = 'localhost'
        db_name = 'osaamiskiekko'
        client = MongoClient(db_host, 27017)
        self.db = client[db_name]

        self.db.conllu.create_index('original_id')


    def load_wordlists(self):
        self.whitelist = load_set('rules/whitelist.txt')
        self.blacklist_keywords = load_set('rules/blacklist-keywords.txt')
        self.blacklist_ngram_candidates = load_set('rules/blacklist-ngram-candidates.txt')
        self.blacklist_ngrams = load_set('rules/blacklist-ngrams.txt')
        self.whitelist_ngrams = load_set('rules/whitelist-ngrams.txt')

        self.overlapping_verbs = load_set('intermediate/overlap-verbs.txt')
        self.overlapping_nouns = load_set('intermediate/overlap-nouns.txt')
        self.overlapping_words = self.overlapping_verbs.union(self.overlapping_nouns)

        self.seen_words = load_set('rules/seen-words.txt').union(self.whitelist)


    def parse_text(self, text, document_number):
        sentences = re.split(SENTENCE_SEPARATOR, text)
        sentence_counter = 0

        for sentence in sentences:
            sentence = sentence.strip()
            if not sentence:
                continue

            if DEBUG_SENTENCE is None or sentence_counter == DEBUG_SENTENCE:
                print('------------------------------')
                print(f"Doc {document_number}, sentence {sentence_counter}: {sentence}")
                response = requests.post(PARSER_URL, data=sentence.encode('utf-8'), headers=HEADERS)
                raw_conllu = response.text
                tokens = parse_conllu(raw_conllu)
                #print(raw_conllu)

                sentence_phrases = parse_sentence(tokens)
                for phrase in sentence_phrases:
                    self.phrase_freqs[phrase] = self.phrase_freqs.get(phrase, 0) + 1
                    self.phrases.append(f"{phrase} ({document_number} / {sentence_counter})")

            sentence_counter += 1
            #if sentence_counter > 5:
                #break

    def preprocess(self, filename, dataset_type):
        document_counter = 0
        with open(filename) as f:
            for line in f:
                doc = ujson.loads(line)
                id = doc['id']

                if filename == 'amk_courses.ndjson':
                    text = doc['metadata']['title'] + "\n\n" + doc['texts']['content']
                else:
                    text = doc['texts']['content']

                print(f"Document {document_counter}: {doc['id']}")

                sentences = re.split(SENTENCE_SEPARATOR, text)
                sentence_counter = 0

                for sentence in sentences:
                    sentence = sentence.strip()
                    if not sentence:
                        continue

                    response = requests.post(PARSER_URL, data=sentence.encode('utf-8'), headers=HEADERS)
                    raw_conllu = response.text

                    self.db.conllu.update_one(
                        { "original_id": id },
                        {
                            "$set": {
                                "original_id": id,
                                "type": dataset_type,
                                "sentence_number": sentence_counter,
                                "conllu": raw_conllu
                            }
                        },
                        upsert=True
                    )

                    sentence_counter += 1
                document_counter += 1


    def analyze_overlap(self):
        print("Analyzing overlap")
        hobby_verbs = set()
        hobby_nouns = set()
        formal_verbs = set()
        formal_nouns = set()

        print("Loading hobby courses")
        counter = 0
        for document in self.db.conllu.find({"type": "hobby"}, None):
            tokens = parse_conllu(document['conllu'])

            for token in tokens:
                if token.category == 'VERB':
                    hobby_verbs.add(token.lemma)
                if token.category == 'NOUN':
                    hobby_nouns.add(token.lemma)
            counter += 1
        print(counter)

        print("Loading formal courses")
        counter = 0
        for document in self.db.conllu.find({"type": "formal"}, None):
            tokens = parse_conllu(document['conllu'])

            for token in tokens:
                if token.category == 'VERB':
                    formal_verbs.add(token.lemma)
                if token.category == 'NOUN':
                    formal_nouns.add(token.lemma)

            counter += 1
            #if counter > 5000:
            #    break
            if counter % 100000 == 0:
                print(counter)

        overlapping_verbs = hobby_verbs.intersection(formal_verbs)
        overlapping_nouns = hobby_nouns.intersection(formal_nouns)

        save_wordlist('intermediate/overlap-verbs.txt', overlapping_verbs)
        save_wordlist('intermediate/overlap-nouns.txt', overlapping_nouns)

        save_wordlist('results/overlap-verbs.txt', overlapping_verbs, blacklist=self.seen_words.union(self.whitelist).union(self.blacklist_keywords))
        save_wordlist('results/overlap-nouns.txt', overlapping_nouns, blacklist=self.seen_words.union(self.whitelist).union(self.blacklist_keywords))


    def find_ngrams(self):
        ngram_freqs = {}

        print("Finding ngrams from hobby courses")
        for document in self.db.conllu.find({"type": "hobby"}, None):
            tokens = parse_conllu(document['conllu'])

            sentence_phrases = parse_sentence(tokens, whitelist=self.overlapping_words, blacklist=self.blacklist_ngram_candidates)
            for phrase in sentence_phrases:
                if phrase in self.blacklist_ngrams:
                    continue

                ngram_freqs[phrase] = ngram_freqs.get(phrase, 0) + 1

        # Keep only ngrams that are found from formal
        print("Validating ngrams from formal courses")
        validated_ngrams = {}
        counter = 0
        for document in self.db.conllu.find({"type": "formal"}, None):
            tokens = parse_conllu(document['conllu'])
            sentence_phrases = parse_sentence(tokens, whitelist=self.overlapping_words, blacklist=self.blacklist_ngram_candidates)

            for phrase in sentence_phrases:
                if phrase in ngram_freqs:
                    validated_ngrams[phrase] = validated_ngrams.get(phrase, 0) + 1

            counter += 1
            if counter % 10000 == 0:
                print(counter)

        save_freqs('results/ngrams_freqs.txt', validated_ngrams, blacklist=self.whitelist_ngrams.union(self.blacklist_ngrams))


    def update_keywords(self, tokens, keywords, global_keywords):
        # Ngrams
        sentence_phrases = parse_sentence(tokens, whitelist=self.overlapping_words, blacklist=self.blacklist_ngram_candidates)
        for phrase in sentence_phrases:
            if phrase in self.whitelist_ngrams:
                keywords[phrase] = keywords.get(phrase, 0.0) + SCORE_NGRAM

        # Standalone words
        for token in tokens:
            if token.category != 'NOUN' and token.category != 'VERB':
                continue

            if token.lemma not in self.overlapping_words:
                continue

            lemma = token.lemma
            if lemma in self.whitelist:
                keywords[lemma] = keywords.get(lemma, 0.0) + SCORE_WORD_WHITELISTED
                global_keywords[lemma] = global_keywords.get(lemma, 0.0) + SCORE_WORD_WHITELISTED
            elif lemma not in self.blacklist_keywords:
                keywords[lemma] = keywords.get(lemma, 0.0) + SCORE_WORD_GENERIC
                global_keywords[lemma] = global_keywords.get(lemma, 0.0) + SCORE_WORD_GENERIC


    def generate_keywords(self):
        global_keywords = {}

        parser.db.hobby_course_keywords.delete_many({})
        parser._generate_keywords('hobby_courses.ndjson', parser.db.hobby_course_keywords, global_keywords)

        parser.db.formal_course_keywords.delete_many({})
        parser._generate_keywords('formal_courses.ndjson', parser.db.formal_course_keywords, global_keywords)
        parser._generate_keywords('amk_courses.ndjson', parser.db.formal_course_keywords, global_keywords)
        parser._generate_keywords('lukio_courses.ndjson', parser.db.formal_course_keywords, global_keywords)

        save_freqs('results/global_keywords.txt', global_keywords, blacklist=self.seen_words.union(self.whitelist).union(self.blacklist_keywords))


    def _generate_keywords(self, filename, db_collection, global_keywords):
        print(f"Generating keywords for {filename}")
        with open(filename) as f:
            counter = 0
            for line in f:
                json = ujson.loads(line)
                id = json['id']
                keywords = {}

                for sentence in self.db.conllu.find({'original_id': id}):
                    tokens = parse_conllu(sentence['conllu'])
                    self.update_keywords(tokens, keywords, global_keywords)

                tuples = sorted(keywords.items(), key=lambda tup: tup[1], reverse=True)

                keywords_json = [
                    {
                        'keyword': keyword,
                        'freq': freq
                    }
                    for keyword, freq in tuples
                ]

                db_collection.insert_one({
                    '_id': id,
                    'keywords': keywords_json
                })

                counter += 1
                if counter % 1000 == 0:
                    print(counter)


if __name__ == '__main__':
    if not os.path.exists('results'):
        os.makedirs('results')

    parser = Parser()
    # parser.preprocess('hobby_courses.ndjson', 'hobby')
    # parser.preprocess('formal_courses.ndjson', 'formal')
    # parser.preprocess('amk_courses.ndjson', 'formal')
    # parser.preprocess('lukio_courses.ndjson', 'formal')

    parser.analyze_overlap()
    parser.find_ngrams()

    parser.generate_keywords()
