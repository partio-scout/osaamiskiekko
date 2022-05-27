import siteList from '../config/public/site-list.json'

// Get the siteId such as fi, en, sv from route params and
// set it to $config
export default ({ $config, params, env }) => {
  const siteId = params.siteId ? params.siteId : 'fi'
  $config.siteId = siteId
  $config.site = siteList[siteId]
  process.env.siteId = siteId
}
