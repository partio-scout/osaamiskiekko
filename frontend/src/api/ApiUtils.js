export const baseURL = (process.env.REACT_APP_BACKEND_URL || '/api');

export const addTypeToSchoolOrOrganization = (schoolOrOrganization, type) => schoolOrOrganization.map(item => {
      const o = Object.assign({}, item);
      o.type_fi = type === 'school' ? 'Oppilaitos' : 'Organisaatio';
      o.type_en = type === 'school' ? 'School' : 'Organization';
      o.type_sv = type === 'school' ? 'Skola' : 'Organisation';
      return o;
  })
