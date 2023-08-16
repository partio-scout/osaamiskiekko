import requests
from bs4 import BeautifulSoup
import time
import ujson

class FieldLoader(object):

    def __init__(self):
        self.degrees = {} # {degree_name: {field: 'Tekniikan alat', level: 'Ammatillinen perustutkinto'}}

    def load(self, url, level):
        print(f"Loading {url}")
        response = requests.get(url)
        if response.status_code != 200:
            raise Exception(f"GET {url} returned {response.status_code}:\n{response.text}")

        raw_html = response.text

        soup = BeautifulSoup(raw_html, 'html.parser')

        for field_div in soup.find_all("div", class_="field_anchored_content"):
            title = field_div.find("h2", class_="anchor-title")
            field_name = title.get_text().strip()

            if field_name == 'Kauppa ja hallinnto':
                field_name = 'Kauppa ja hallinto'

            if field_name == 'Tietojenkäsittely ja tietoliikenne (ICT)':
                field_name = 'Tietojenkäsittely ja tietoliikenne'

            for degree_heading in field_div.find_all("h4"):
                degree_name = degree_heading.get_text().strip()
                if len(degree_name) <= 1:
                    continue

                self.degrees[degree_name] = {
                        'field': field_name,
                        'level': level
                }

    def save(self, filename):
        with open(filename, 'w') as f:
            f.write(ujson.dumps(self.degrees, indent=2, escape_forward_slashes=False, ensure_ascii=False))
            f.write('\n')


if __name__ == '__main__':
    loader = FieldLoader()

    loader.load('https://www.oph.fi/fi/koulutus-ja-tutkinnot/ammatilliset-perustutkinnot', 'Ammatillinen perustutkinto')
    time.sleep(1)
    loader.load('https://www.oph.fi/fi/koulutus-ja-tutkinnot/ammattitutkinnot', 'Ammattitutkinto')
    time.sleep(1)
    loader.load('https://www.oph.fi/fi/koulutus-ja-tutkinnot/erikoisammattitutkinnot', 'Erikoisammattitutkinto')
    loader.save('fields.json')

    print("Done")
