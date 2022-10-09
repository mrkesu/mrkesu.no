param staticSiteName string = 'mrkesu'
param domainName string = 'mrkesu.no'

param location string

resource staticSite 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticSiteName
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/mrkesu/mrkesu.no'
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

resource customDomain 'Microsoft.Web/staticSites/customDomains@2022-03-01' = {
  parent: staticSite
  name: domainName
  properties: {
  }
}

output defaultHostname string = staticSite.properties.defaultHostname
