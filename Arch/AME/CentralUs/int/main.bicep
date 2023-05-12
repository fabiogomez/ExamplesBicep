param vnetName string
param vnetAddressPrefix string
param subnetName string
param subnetAddressPrefix string
param vaultName string
param location string = resourceGroup().location
param skuName string 

module networking '../../../modules/networking/main.bicep' = {
  name: 'networking'
  params: {
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnetName: subnetName
    subnetAddressPrefix: subnetAddressPrefix
    location: location
  }
}

module keyVaults '../../../modules/keyvaults/main.bicep' = {
  name: 'keyVaults'
  params: {
    vaultName: vaultName
    location: location
    skuName: skuName
    subnetId: networking.outputs.subnetId
  }
}
