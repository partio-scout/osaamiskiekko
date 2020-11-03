/**
 * Temporary script for storing all content from Strapi locally.
 *
 * @type {module:fs}
 */
const fs = require('fs')
const path = require('path')
const fetch = require('node-fetch')

const main = async () => {
    console.log('')

    await saveContent('academicdegrees')
    await saveContent('competencedegreelinks')
    await saveContent('competences')
    await saveContent('fieldofstudies')
    await saveContent('nqfs')
    await saveContent('organizations')
    await saveContent('pages')
    await saveContent('schools')

    console.log('\nDONE\n')
}

/**
 * Fetches content based on a content type from Strapi and saves it to a json file.
 *
 * @param contentType
 * @returns {Promise<any>}
 */
const saveContent = async (contentType) => {
    // See: https://strapi.io/documentation/v3.x/content-api/parameters.html#limit
    const url = 'https://api.www.osaamiskiekko.fi/' + contentType + '?_limit=-1'

    try {
        const response = await fetch(url, {
            timeout: 10000
        })

        if (response.status !== 200) {
            throw new Error('Invalid status code ' + response.status)
        }

        const elements = await response.json()

        for (const element of elements) {
            if (element.logo !== undefined && element.logo !== null && typeof element.logo.url === 'string') {
                // Change all logo urls from Google Storage to a local url.
                // https://storage.googleapis.com/osaamiskiekko-production/6dea5429529b4c38bfb696b6fa517d33/hamk_nelio.png
                element.logo.url = element.logo.url.replace(/https:\/\/storage.googleapis.com\/osaamiskiekko-production\/[a-z0-9]+\//, '/images/')
            }
        }

        const dataPath = path.join(__dirname, '/../public/data/' + contentType + '.json')
        fs.writeFileSync(dataPath, JSON.stringify(elements, null, 2))
    } catch (error) {
        console.error(error.message)
        throw new Error('ERROR downloading data from: ' + url)
    }
}

main()
