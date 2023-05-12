param vnetName string
param vnetAddressPrefix string
param subnetName string
param subnetAddressPrefix string
param location string

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  parent: vnet
  name: subnetName
  properties: {
    addressPrefix: subnetAddressPrefix
    serviceEndpoints: [
      {
        service: 'Microsoft.KeyVault'
        locations: [
          'WestEurope '
        ]
      }
    ]
    
  }
}

output subnetId string = subnet.id
