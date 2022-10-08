targetScope = 'subscription'

param location string = 'norwayeast'


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'mrkesu.no-rg'
  location: location
}
