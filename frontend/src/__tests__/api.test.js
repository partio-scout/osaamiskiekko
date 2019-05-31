import mockAxios from 'jest-mock-axios';
import * as api from '../api/Api';
import { schoolData, organizationData } from '../__testdata__/';
import translations from '../translations/translations';
 
afterEach(() => {
    // cleaning up the mess left behind the previous test
    mockAxios.reset();
});

describe('strapi rest api', () => {
  test('school type filled in', async () => {
    const requestPromise = api.getSchools();
    mockAxios.mockResponse({ data: schoolData });
    const schools = await requestPromise;

    expect(mockAxios.get).toHaveBeenCalledWith('/api/schools');

    expect(schools[0].type_fi).toBe(translations.fi["institution.type.school"]);
    expect(schools[0].type_en).toBe(translations.en["institution.type.school"]);
    expect(schools[0].type_sv).toBe(translations.sv["institution.type.school"]);
  });

  test('organization type filled in', async () => {
    const requestPromise = api.getOrganizations();
    mockAxios.mockResponse({ data: organizationData});
    const orgs = await requestPromise;

    expect(mockAxios.get).toHaveBeenCalledWith('/api/organizations');

    expect(orgs[0].type_fi).toBe(translations.fi["institution.type.organization"]);
    expect(orgs[0].type_en).toBe(translations.en["institution.type.organization"]);
    expect(orgs[0].type_sv).toBe(translations.sv["institution.type.organization"]);
  });
});
