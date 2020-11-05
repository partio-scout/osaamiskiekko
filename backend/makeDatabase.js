/**
 * Generates JSON files based on JSON files in /backend/data and stores them in /frontend/public/data
 *
 * Note that the generated files in /frontend/public/data should be included in the git repository,
 * as makeDatabase.js is not run when deploying the software.
 *
 * @type {module:fs}
 */
const fs = require('fs')
const path = require('path')

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

const saveContent = async (contentType) => {

    try {
        let filePath

        // Read content.
        filePath = path.join(__dirname, '/data/' + contentType + '.json')
        const data = fs.readFileSync(filePath);
        const elements = JSON.parse(data);

        // Create destination directory, if it does not exist.
        const destDirPath = path.join(__dirname, '/../frontend/public/data/' + contentType)
        if (fs.existsSync(destDirPath) === false) {
            fs.mkdirSync(destDirPath)
        }

        // Store all elements in an index.json file.
        filePath = path.join(destDirPath, 'index.json')
        fs.writeFileSync(filePath, JSON.stringify(elements))

        // Create separate json files based on the id to speed up things on the frontend.
        for (const element of elements) {
            filePath = path.join(destDirPath, 'id.' + element.id + '.json')
            fs.writeFileSync(filePath, JSON.stringify(element))

            // If the content type is competencedegreelinks, also create separate json files based on
            // competence.id and academicdegree.id.
            if (contentType === 'competencedegreelinks') {
                filePath = path.join(destDirPath, 'competence.' + element.competence.id + '.json')
                fs.writeFileSync(filePath, JSON.stringify(element))

                filePath = path.join(destDirPath, 'academicdegree.' + element.academicdegree.id + '.json')
                fs.writeFileSync(filePath, JSON.stringify(element))
            }
        }
    } catch (error) {
        console.error(error.message)
        throw new Error('ERROR with content type: ' + contentType)
    }
}

main()
