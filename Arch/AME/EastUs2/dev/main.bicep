param vnetName string
param vnetAddressPrefix string
param subnetName string
param subnetAddressPrefix string
param vaultName string
param location string = resourceGroup().location
param skuName string 

module networking 'br:acrza66tl3ac6laq.azurecr.io/bicep/modules/networking:1.0.1' = {
  name: 'networking'
  params: {
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnetName: subnetName
    subnetAddressPrefix: subnetAddressPrefix
    location: location
  }
}

module keyVaults 'br:acrza66tl3ac6laq.azurecr.io/bicep/modules/keyvaults:1.0.1' = {
  name: 'keyVaults'
  params: {
    vaultName: vaultName
    location: location
    skuName: skuName
    subnetId: networking.outputs.subnetId
  }
}
