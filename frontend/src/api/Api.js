import axios from 'axios';
import { baseURL } from './ApiUtils';
import { addTypeToSchoolOrOrganization } from './ApiUtils';

const getSchools = async () => {
  const schools = await axios(`${baseURL}/schools`);
  return addTypeToSchoolOrOrganization(schools.data, 'school');
}

const getOrganizations = async () => {
  const organizations = await axios(`${baseURL}/organizations`);
  return addTypeToSchoolOrOrganization(organizations.data, 'organization');
}

const getAcademicDegrees = async () => {
  const academicdegrees = await axios(`${baseURL}/academicdegrees`);
  return academicdegrees.data;
}

const getCompetencedegreelinks = async () => {
  const competencedegreelinks = await axios(`${baseURL}/competencedegreelinks`);
  return competencedegreelinks.data;
}

const getCompetences = async () => {
  const competences = await axios(`${baseURL}/competences`);
  return competences.data;
}

const getFieldofstudies = async () => {
  const fieldofstudies = await axios(`${baseURL}/fieldofstudies`);
  return fieldofstudies.data;
}

const getNqfs = async () => {
  const nqfs = await axios(`${baseURL}/nqfs`);
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