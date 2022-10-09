targetScope = 'subscription'

param location string = 'norwayeast'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'mrkesu.no-rg'
  location: location
}

module staticSite 'staticSites.bicep' = {
  name: 'staticSite'
  scope: resourceGroup(rg.name)
  params: {
    location: rg.location
  }
}
