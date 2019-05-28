import translations from '../translations/translations';

export const institutionTypes = {
    ORGANIZATION: 'organization',
    SCHOOL: 'school',
};

export const baseURL = (process.env.REACT_APP_BACKEND_URL || '/api');

export const addTypeToInstitution = (schoolOrOrganization, type) => schoolOrOrganization.map(item => {
    const o = Object.assign({}, item);
    const translationKey = `institution.type.${type}`;

    o.type_fi = translations.fi[translationKey];
    o.type_en = translations.en[translationKey];
    o.type_sv = translations.sv[translationKey];
    return o;
})
