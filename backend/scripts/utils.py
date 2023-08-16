from bs4 import BeautifulSoup

def get_localized_value(item):
    if item is None:
        return None

    for lang in ['fi', 'sv', 'en']:
        if lang in item:
            return item[lang].strip()


def html_to_plaintext(html):
    if not html:
        return None

    soup = BeautifulSoup(html, 'html.parser')
    plaintext = soup.get_text("\n", strip=True)

    return plaintext


def format_credits(raw_credits):
    if raw_credits is None:
        return '-'

    return str(raw_credits).replace('.', ',').removesuffix(',0') + " op"
