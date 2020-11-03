import axios from 'axios';
import { baseURL, addTypeToInstitution, institutionTypes } from './ApiUtils';

const getSchools = async () => {
  const schools = await axios.get(`${baseURL}/schools.json`);
  return addTypeToInstitution(schools.data, institutionTypes.SCHOOL);
}

const getOrganizations = async () => {
  const organizations = await axios.get(`${baseURL}/organizations.json`);
  return addTypeToInstitution(organizations.data, institutionTypes.ORGANIZATION);
}

const getAcademicDegrees = async () => {
  const academicdegrees = await axios.get(`${baseURL}/academicdegrees.json`);
  return academicdegrees.data;
}

const getCompetenceDegreeLinks = async () => {
  const competencedegreelinks = await axios.get(`${baseURL}/competencedegreelinks.json`);
  return competencedegreelinks.data;
}

const getCompetenceDegreeLink = async (id) => {
  id = parseInt(id)
  const competencedegreelinks = await axios.get(`${baseURL}/competencedegreelinks.json`);

  const element = competencedegreelinks.data.find(element => element.id === id)
  return element !== undefined ? [element] : []
}

const getCreditingInfosForCompetence = async (id) => {
  id = parseInt(id)
  const competencedegreelinks = await axios.get(`${baseURL}/competencedegreelinks.json`);

  return competencedegreelinks.data.filter(element => element.competence.id === id)
}

const getCreditingInfosForDegree = async (id) => {
  id = parseInt(id)
  const competencedegreelinks = await axios.get(`${baseURL}/competencedegreelinks.json`);

  return competencedegreelinks.data.filter(element => element.academicdegree.id === id)
}

const getCompetences = async () => {
  const competences = await axios.get(`${baseURL}/competences.json`);
  return competences.data;
}

const getFieldofstudiesWithId = async (id) => {
  id = parseInt(id)
  const fieldofstudies = await axios.get(`${baseURL}/fieldofstudies.json`);

  const element = fieldofstudies.data.find(element => element.id === id)
  return element !== undefined ? [element] : []
}

const getFieldofstudies = async () => {
  const fieldofstudies = await axios.get(`${baseURL}/fieldofstudies.json`);
  return fieldofstudies.data;
}

const getNqfs = async () => {
  const nqfs = await axios.get(`${baseURL}/nqfs.json`);
  return nqfs.data;
}

const getMarkdownPages = async () => {
  const pages = await axios.get(`${baseURL}/pages.json`);
  return pages;
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
};
