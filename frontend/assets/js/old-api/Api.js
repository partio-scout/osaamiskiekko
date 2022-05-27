import { /* baseURL, */ addTypeToInstitution, institutionTypes } from './ApiUtils'

const getSchools = () => {
  const schools = require('~/static/data/schools/index.json') // require('~/static/data/schools/index.json')
  return addTypeToInstitution(schools, institutionTypes.SCHOOL)
}

const getOrganizations = () => {
  const organizations = require('~/static/data/organizations/index.json')
  return addTypeToInstitution(organizations, institutionTypes.ORGANIZATION)
}

const getAcademicDegrees = () => {
  const academicdegrees = require('~/static/data/academicdegrees/index.json')
  return academicdegrees
}

const getCompetenceDegreeLinks = () => {
  const competencedegreelinks = require('~/static/data/competencedegreelinks/index.json')
  return competencedegreelinks
}

const getCompetenceDegreeLink = (id) => {
  const competencedegreelinks = require(`~/static/data/competencedegreelinks/id.${id}.json`)
  return [competencedegreelinks]
}

const getCreditingInfosForCompetence = (id) => {
  const competencedegreelinks = require(`~/static/data/competencedegreelinks/competence.${id}.json`)
  return competencedegreelinks
}

const getCreditingInfosForDegree = (id) => {
  const competencedegreelinks = require(`~/static/data/competencedegreelinks/academicdegree.${id}.json`)
  return competencedegreelinks
}

const getCompetences = () => {
  const competences = require('~/static/data/competences/index.json')
  return competences
}

const getFieldofstudiesWithId = (id) => {
  id = parseInt(id)
  const fieldofstudies = require('~/static/data/fieldofstudies/index.json')

  const element = fieldofstudies.find(element => element.id === id)
  return element !== undefined ? [element] : []
}

const getFieldofstudies = () => {
  const fieldofstudies = require('~/static/data/fieldofstudies/index.json')
  return fieldofstudies
}

const getNqfs = () => {
  const nqfs = require('~/static/data/nqfs/index.json')
  return nqfs
}

const getMarkdownPages = () => {
  const pages = require('~/static/data/pages/index.json')
  return pages
}

export {
  getSchools,
  getOrganizations,
  getAcademicDegrees,
  getCompetenceDegreeLinks,
  getCompetenceDegreeLink,
  getCreditingInfosForCompetence,
  getCreditingInfosForDegree,
  getCompetences,
  getFieldofstudies,
  getFieldofstudiesWithId,
  getNqfs,
  getMarkdownPages
}
