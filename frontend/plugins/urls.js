export default (context, inject) => {
  const siteId = context.$config.siteId

  const urls = {
    home: '/' + siteId + '/',
    searchForm: '/' + siteId + '/#search-form',
    students: '/' + siteId + '/students',
    signUp: '/' + siteId + '/sign-up',
    schoolsAndOrganizations: '/' + siteId + '/schools-and-organizations',
    privacyPolicy: '/' + siteId + '/privacy-policy',
    accessibility: '/' + siteId + '/accessibility'
  }

  const goTo = (urlName) => {
    context.app.router.push(urls[urlName])
  }

  inject('urls', urls)
  inject('goTo', goTo)
}
