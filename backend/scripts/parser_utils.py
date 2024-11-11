import os
from collections import namedtuple

Conllu = namedtuple('Conllu', ['original', 'lemma', 'category', 'verbmood', 'verbform', 'nouncase'])

def save_wordlist(filename, container, blacklist=None):
    with open(filename, 'w') as f:
        for word in container:
            if blacklist is not None and word in blacklist:
                continue

            f.write(word)
            f.write('\n')


def save_freqs(filename, container, blacklist=None):
    with open(filename, 'w') as f:
        tuples = sorted(container.items(), key=lambda tup: tup[1], reverse=True)

        for payload, freq in tuples:
            if blacklist is not None and payload in blacklist:
                continue

            f.write(f'{freq}\t{payload}')
            f.write('\n')


def load_set(filename):
    container = set()

    if not os.path.exists(filename):
        return container

    with open(filename) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue

            container.add(line)

    return container


def parse_conllu(raw, debug=False):
    if debug:
        print(raw)

    rows = raw.split('\n')

    iterator = iter(rows)
    next(iterator) # The first row is the original sentence

    tokens = []
    for row in rows:
        if row.startswith('#'):
            continue

        parts = row.split('\t')
        if len(parts) < 2:
            continue

        # parts[5] == 'Foreign=Yes'
        verbmood = None
        verbform = None
        nouncase = None

        details = parts[5].split('|') # Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin|Voice=Act

        for detail in details:
            fragments = detail.split('=')
            if len(fragments) == 2:
                if fragments[0] == 'Mood':
                    verbmood = fragments[1]
                elif fragments[0] == 'VerbForm':
                    verbform = fragments[1]
                elif fragments[0] == 'Case':
                    nouncase = fragments[1]

        #print(parts)
        lemma = parts[2]
        if len(lemma) < 2 or len(lemma) > 32 or lemma == '..': # lemma == '-' or lemma == '–' or lemma == '.' or lemma == '/'
            continue

        tokens.append(Conllu(
            original = parts[1].lower(),
            lemma = lemma,
            category = parts[3],
            verbmood = verbmood,
            verbform = verbform,
            nouncase = nouncase,
        ))

    return tokens
