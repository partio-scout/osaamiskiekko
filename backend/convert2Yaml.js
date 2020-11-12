/**
 * Temporary script to convert the json files to yaml files.
 * The script also trims strings and sorts properties.
 */
const fs = require('fs')
const path = require('path')
const YAML = require('js-yaml')

const main = async () => {
    console.log('')

    try {
        await convertOrganizations()
        await convertCompetences()

        await convertSchools()
        await convertAcademicdegrees()

        await convertCompetencedegreelinks()

        await convertNqfs()
        await convertFieldofstudies()

        await convertPages()
    } catch (error) {
        console.error(error.message)
    }

    console.log('\nDONE\n')
}

/**
 * Trims all strings in the object and sorts its properties.
 *
 * @param obj
 */
const fixObj = (obj) => {
    for (const k in obj) {
        const v = obj[k]

        if (typeof v === 'string') {
            obj[k] = v.trim()
        }
    }

    const entries = Object.entries(obj)

    const sortPoints = (prop) => {
        if (prop === 'id') {
            return 10
        }

        if (prop === 'identification' || prop === 'path_identifier') {
            return 9
        }

        if (prop.includes('Id') === true) {
            return 8
        }

        if (prop.includes('name_fi') === true || prop.includes('title_fi') === true) {
            return -10
        }

        if (prop.includes('name_en') === true || prop.includes('title_en') === true) {
            return -11
        }

        if (prop.includes('name_sv') === true || prop.includes('title_sv') === true) {
            return -12
        }

        if (prop.includes('description_fi') === true || prop.includes('text_fi') === true) {
            return -13
        }

        if (prop.includes('description_en') === true || prop.includes('text_en') === true) {
            return -14
        }

        if (prop.includes('description_sv') === true || prop.includes('text_sv') === true) {
            return -15
        }

        return 0
    }

    entries.sort((a, b) => {
        const points = sortPoints(b[0]) - sortPoints(a[0])

        if (points !== 0) {
            return points
        }

        return a[0].localeCompare(b[0])
    })

    for (const prop in obj) {
        delete obj[prop]
    }

    for (const entry of entries) {
        obj[entry[0]] = entry[1]
    }
}

/**
 * Reads a list of objects from a JSON file.
 *
 * @param contentType
 */
const readFromJSON = (contentType) => {
    const filePath = path.join(__dirname, '/data/' + contentType + '.json')
    const data = fs.readFileSync(filePath);
    return JSON.parse(data);
}

/**
 * Saves a list of objects to YAML files.
 * Before the list is saved, fixObj is called on all objects.
 * The name of the YAML file will be the id of the object.
 *
 * @param contentType
 * @param objList
 */
const saveToYAML = (contentType, objList) => {
    for (const obj of objList) {
        fixObj(obj)
    }

    const dirPath = path.join(__dirname, '/data/' + contentType)
    if (fs.existsSync(dirPath) === false) {
        fs.mkdirSync(dirPath)
    }

    for (const obj of objList) {
        const output = YAML.safeDump(obj, {noCompatMode: true, noArrayIndent: true})
        const fileName = obj.id.toString().padStart(5, '0')
        const filePath = path.join(dirPath, fileName + '.yaml')
        fs.writeFileSync(filePath, output)
    }
}

const convertOrganizations = async () => {
    const organizations = readFromJSON('organizations')

    for (const org of organizations) {
        delete org.competences
    }

    saveToYAML('organizations', organizations)
}

const convertCompetences = async () => {
    const competences = readFromJSON('competences')

    for (const comp of competences) {
        comp.nqfId = null
        if (comp.nqf !== null) {
            comp.nqfId = comp.nqf.id
        }
        delete comp.nqf

        comp.organizationId = null
        if (comp.organization !== null) {
            comp.organizationId = comp.organization.id
        }
        delete comp.organization

        delete comp.competencedegreelinks
    }

    saveToYAML('competences', competences)
}

const convertSchools = async () => {
    const schools = readFromJSON('schools')

    for (const school of schools) {
        delete school.academicdegrees
    }

    saveToYAML('schools', schools)
}

const convertAcademicdegrees = async () => {
    const academicdegrees = readFromJSON('academicdegrees')

    for (const academicdeg of academicdegrees) {
        academicdeg.nqfId = null
        if (academicdeg.nqf !== null) {
            academicdeg.nqfId = academicdeg.nqf.id
        }
        delete academicdeg.nqf

        academicdeg.schoolId = null
        if (academicdeg.school !== null) {
            academicdeg.schoolId = academicdeg.school.id
        }
        delete academicdeg.school

        academicdeg.fieldofstudyId = null
        if (academicdeg.fieldofstudy !== null) {
            academicdeg.fieldofstudyId = academicdeg.fieldofstudy.id
        }
        delete academicdeg.fieldofstudy

        delete academicdeg.competencedegreelinks
    }

    saveToYAML('academicdegrees', academicdegrees)
}

const convertCompetencedegreelinks = async () => {
    const competencedegreelinks = readFromJSON('competencedegreelinks')

    for (const competencedegreelink of competencedegreelinks) {
        competencedegreelink.competenceId = null
        if (competencedegreelink.competence !== null) {
            competencedegreelink.competenceId = competencedegreelink.competence.id
        }
        delete competencedegreelink.competence

        competencedegreelink.academicdegreeId = null
        if (competencedegreelink.academicdegree !== null) {
            competencedegreelink.academicdegreeId = competencedegreelink.academicdegree.id
        }
        delete competencedegreelink.academicdegree
    }

    saveToYAML('competencedegreelinks', competencedegreelinks)
}

const convertNqfs = async () => {
    const nqfs = readFromJSON('nqfs')

    saveToYAML('nqfs', nqfs)
}

const convertFieldofstudies = async () => {
    const fieldofstudies = readFromJSON('fieldofstudies')

    saveToYAML('fieldofstudies', fieldofstudies)
}

const convertPages = async () => {
    const pages = readFromJSON('pages')

    saveToYAML('pages', pages)
}

main()
