/**
 * Generates JSON files based on YAML files in /backend/data and stores them in /frontend/public/data
 *
 * Note that the generated files in /frontend/public/data should be included in the git repository,
 * as makeDatabase.js is currently not run when deploying the software.
 *
 * @type {module:fs}
 */
const fs = require('fs')
const path = require('path')
const YAML = require('js-yaml')

/**
 * Set content types.
 *
 * 'foreignContent' populates the objects with foreign objects from a different content type (foreignContentType).
 * The relationship can be either one-to-one or one-to-many.
 * The key connecting the foreign object with the object can be set either in the foreign objects (foreignKey)
 * or in the object (localKey)
 *
 * 'renames' renames properties in the objects. The software was previously built with Strapi,
 * and some property names containing 'Id' are expected to be without 'Id'.
 * For example: 'academicdegreeId' => 'academicdegree'
 */
const contentTypeList = {
    academicdegrees: {
        foreignContent: {
            nqf: {
                type: 'one2one',
                foreignContentType: 'nqfs',
                localKey: 'nqfId'
            },
            school: {
                type: 'one2one',
                foreignContentType: 'schools',
                localKey: 'schoolId'
            },
            fieldofstudy: {
                type: 'one2one',
                foreignContentType: 'fieldofstudies',
                localKey: 'fieldofstudyId'
            },
            competencedegreelinks: {
                type: 'one2many',
                foreignContentType: 'competencedegreelinks',
                foreignKey: 'academicdegreeId'
            }
        },
        renames: {
            'competencedegreelinks.academicdegreeId': 'academicdegree',
            'competencedegreelinks.competenceId': 'competence'
        }
    },
    competencedegreelinks: {
        foreignContent: {
            competence: {
                type: 'one2one',
                foreignContentType: 'competences',
                localKey: 'competenceId'
            },
            academicdegree: {
                type: 'one2one',
                foreignContentType: 'academicdegrees',
                localKey: 'academicdegreeId'
            }
        },
        renames: {
            'competence.nqfId': 'nqf',
            'competence.organizationId': 'organization',
            'academicdegree.nqfId': 'nqf',
            'academicdegree.schoolId': 'school',
            'academicdegree.fieldofstudyId': 'fieldofstudy'
        }
    },
    competences: {
        foreignContent: {
            nqf: {
                type: 'one2one',
                foreignContentType: 'nqfs',
                localKey: 'nqfId'
            },
            organization: {
                type: 'one2one',
                foreignContentType: 'organizations',
                localKey: 'organizationId'
            },
            competencedegreelinks: {
                type: 'one2many',
                foreignContentType: 'competencedegreelinks',
                foreignKey: 'competenceId'
            }
        },
        renames: {
            'competencedegreelinks.academicdegreeId': 'academicdegree',
            'competencedegreelinks.competenceId': 'competence'
        }
    },
    fieldofstudies: {
        foreignContent: {},
        renames: {}
    },
    nqfs: {
        foreignContent: {},
        renames: {}
    },
    organizations: {
        foreignContent: {
            competences: {
                type: 'one2many',
                foreignContentType: 'competences',
                foreignKey: 'organizationId'
            }
        },
        renames: {
            'competences.organizationId': 'organization',
            'competences.nqfId': 'nqf'
        }
    },
    pages: {
        foreignContent: {},
        renames: {}
    },
    schools: {
        foreignContent: {
            academicdegrees: {
                type: 'one2many',
                foreignContentType: 'academicdegrees',
                foreignKey: 'schoolId'
            }
        },
        renames: {
            'academicdegrees.schoolId': 'school',
            'academicdegrees.nqfId': 'nqf',
            'academicdegrees.fieldofstudyId': 'fieldofstudy'
        }
    }
}

// Store all content here.
const content = {}

const main = async () => {
    console.log('')

    // Read the content from yaml files.
    for (const contentType in contentTypeList) {
        content[contentType] = []

        const dirPath = path.join(__dirname, '/data/' + contentType)

        fs.readdirSync(dirPath).forEach(file => {
            if (file.includes('.yaml') === false) {
                return
            }

            const filePath = path.join(dirPath, file)
            const fileContent = fs.readFileSync(filePath)

            content[contentType].push(YAML.safeLoad(fileContent.toString()))
        })
    }

    // Store the content as json.
    for (const contentType in contentTypeList) {
        const foreignContent = contentTypeList[contentType].foreignContent
        const renames = contentTypeList[contentType].renames

        // Create destination directory, if it does not exist.
        const destDirPath = path.join(__dirname, '/../frontend/public/data/' + contentType)
        if (fs.existsSync(destDirPath) === false) {
            fs.mkdirSync(destDirPath)
        }

        // Get the list of objects. Make a copy as we want to avoid circular references.
        const objList = JSON.parse(JSON.stringify(content[contentType]))

        // Populate the objects with foreign content.
        for (const prop in foreignContent) {
            const fc = foreignContent[prop]

            for (const obj of objList) {
                let foreignObjList

                if (fc.localKey !== undefined) {
                    if (obj[fc.localKey] === null) {
                        continue
                    }

                    foreignObjList = findByValue(fc.foreignContentType, 'id', obj[fc.localKey])
                } else {
                    foreignObjList = findByValue(fc.foreignContentType, fc.foreignKey, obj.id)
                }

                if (fc.type === 'one2one') {
                    if (foreignObjList.length !== 1) {
                        console.log(contentType, prop, fc, obj)
                        throw new Error('Foreign objects are too many or none for a one2one relationship.');
                    }

                    obj[prop] = foreignObjList[0]
                } else {
                    obj[prop] = foreignObjList
                }
            }
        }

        // Rename properties in the objects.
        for (const propPathFrom in renames) {
            const newPropName = renames[propPathFrom]

            for (const obj of objList) {
                renameProperty(obj, propPathFrom, newPropName)
            }
        }

        // Store all elements in an index.json file.
        const filePath = path.join(destDirPath, 'index.json')
        fs.writeFileSync(filePath, JSON.stringify(objList))


        // Create separate json files based on the id to speed up things on the frontend.
        for (const obj of objList) {
            let filePath = path.join(destDirPath, 'id.' + obj.id + '.json')
            fs.writeFileSync(filePath, JSON.stringify(obj))
        }

        // If the content type is competencedegreelinks, also create separate json files based on
        // competence.id and academicdegree.id.
        if (contentType === 'competencedegreelinks') {
            // Add the objects into the following structure.
            let objListByKey = {
                competence: {
                    // competenceId => list of objects with this competenceId
                },
                academicdegree: {
                    // academicdegreeId => list of objects with this academicdegree
                }
            }

            for (const obj of objList) {
                for (const k in objListByKey) {
                    const objList2 = objListByKey[k]
                    const id = obj[k].id

                    if (objList2[id] === undefined) {
                        objList2[id] = []
                    }

                    objList2[id].push(obj)
                }
            }

            for (const k in objListByKey) {
                const objList2 = objListByKey[k]

                for (const id in objList2) {
                    let filePath = path.join(destDirPath, k + '.' + id + '.json')
                    fs.writeFileSync(filePath, JSON.stringify(objList2[id]))
                }
            }
        }
    }

    console.log('\nDONE\n')
}

/**
 * Finds an object by a property value.
 *
 * @param contentType
 * @param propName
 * @param propValue
 * @returns {any}
 */
const findByValue = (contentType, propName, propValue) => {
    const objList = content[contentType].filter(obj => obj[propName] === propValue)

    // Avoid circular references.
    return JSON.parse(JSON.stringify(objList))
}

/**
 * Renames a property.
 *
 * Example object:
 *
 * {
 *     a: {
 *         b: 1
 *     },
 *     list: [
 *         {
 *             c: 2
 *         },
 *         {
 *             c: 3
 *         }
 *     ]
 * }
 *
 * Calling:
 *
 * renameProperty(obj, 'a.b', 'bb)
 * renameProperty(obj, 'list.c', 'cc)
 *
 * will rename the properties in the object like this:
 *
 * {
 *     a: {
 *         bb: 1
 *     },
 *     list: [
 *         {
 *             cc: 2
 *         },
 *         {
 *             cc: 3
 *         }
 *     ]
 * }
 *
 * @param obj
 * @param propPathFrom
 * @param newPropName
 */
const renameProperty = (obj, propPathFrom, newPropName) => {
    const propPathFromArray = propPathFrom.split('.')

    if (propPathFromArray.length === 1) {
        const oldPropName = propPathFromArray[0]

        obj[newPropName] = obj[oldPropName]
        delete obj[oldPropName]
    } else {
        const propName = propPathFromArray.shift()

        if (Array.isArray(obj[propName]) === true) {
            for (const obj2 of obj[propName]) {
                renameProperty(obj2, propPathFromArray.join('.'), newPropName)
            }
        } else {
            renameProperty(obj[propName], propPathFromArray.join('.'), newPropName)
        }
    }
}

main()
