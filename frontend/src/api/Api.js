import axios from 'axios';
import { baseURL, addTypeToInstitution, institutionTypes } from './ApiUtils';

const getSchools = async () => {
  const schools = await axios.get(`${baseURL}/schools`);
  return addTypeToInstitution(schools.data, institutionTypes.SCHOOL);
}

const getOrganizations = async () => {
  const organizations = await axios.get(`${baseURL}/organizations`);
  return addTypeToInstitution(organizations.data, institutionTypes.ORGANIZATION);
}

const getAcademicDegrees = async () => {
  const academicdegrees = await axios.get(`${baseURL}/academicdegrees`);
  return academicdegrees.data;
}

const getCompetencedegreelinks = async () => {
  const competencedegreelinks = await axios.get(`${baseURL}/competencedegreelinks`);
  return competencedegreelinks.data;
}

const getCompetences = async () => {
  const competences = await axios.get(`${baseURL}/competences`);
  return competences.data;
}

const getFieldofstudies = async () => {
  const fieldofstudies = await axios.get(`${baseURL}/fieldofstudies`);
  return fieldofstudies.data;
}

const getNqfs = async () => {
  const nqfs = await axios.get(`${baseURL}/nqfs`);
  return nqfs.data;
}

export { 
  getSchools,
  getOrganizations,
  getAcademicDegrees,
  getCompetencedegreelinks,
  getCompetences,
  getFieldofstudies,
  getNqfs
};
