import translations from './translations/translations'

export const institutionTypes = {
  ORGANIZATION: 'organization',
  SCHOOL: 'school'
}

// export const baseURL = (process.env.NETLIFY_BACKEND_URL || document.location.origin + '/data')

export const addTypeToInstitution = (schoolOrOrganization, type) => schoolOrOrganization.map((item) => {
  const o = Object.assign({}, item)
  const translationKey = `institution.type.${type}`

  o.typed_id = `${type}_${item.id}`

  o.type_fi = translations.fi[translationKey]
  o.type_en = translations.en[translationKey]
  o.type_sv = translations.sv[translationKey]
  return o
})
