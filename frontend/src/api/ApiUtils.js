export const baseURL = (process.env.REACT_APP_BACKEND_URL || '/api');

export const addTypeToSchoolOrOrganization = (schoolOrOrganization, type) => schoolOrOrganization.map(item => {
    if (type === 'school') {
      const o = Object.assign({}, item);
      o.type_fi = 'Oppilaitos';
      o.type_en = 'School';
      o.type_se = 'Skola'
      return o;
    } else if (type === 'organization') {
      const o = Object.assign({}, item);
      o.type_fi = 'Organisaatio';
      o.type_en = 'Organization';
      o.type_se = 'Organisation'
      return o;
    }
    return null;
  })
