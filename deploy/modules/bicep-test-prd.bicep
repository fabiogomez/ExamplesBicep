param vaults_fg28keyvaultprd_name string = 'fg28keyvaultprd'
param virtualNetworks_fg28prd_vnet_name string = 'fg28prd-vnet'

resource vaults_fg28keyvaultprd_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_fg28keyvaultprd_name
  location: 'westeurope'
  tags: {
    APPID: 'MSDN'
    BILLINGCODE: 'MSDN'
    CMS: 'US-ITS'
    COUNTRY: 'US'
    CSCLASS: 'CON'
    CSQUAL: 'Intellectual Property'
    CSTYPE: 'Deloitte'
    ENVIRONMENT: 'SBX'
    FUNCTION: 'SVC'
    GROUPCONTACT: 'fgomezguzman@deloitte.com'
    MEMBERFIRM: 'US'
    PRIMARYCONTACT: 'fgomezguzman@deloitte.com'
  }
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '36da45f1-dd2c-4d1f-af13-5abe46b99921'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: [
        {
          id: virtualNetworks_fg28prd_vnet_name_fg28subnetprd.id
        }
      ]
    }
    accessPolicies: []
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: 'https://${vaults_fg28keyvaultprd_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource virtualNetworks_fg28prd_vnet_name_resource 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: virtualNetworks_fg28prd_vnet_name
  location: 'westeurope'
  tags: {
    APPID: 'MSDN'
    BILLINGCODE: 'MSDN'
    CMS: 'US-ITS'
    COUNTRY: 'US'
    CSCLASS: 'CON'
    CSQUAL: 'Intellectual Property'
    CSTYPE: 'Deloitte'
    ENVIRONMENT: 'SBX'
    FUNCTION: 'SVC'
    GROUPCONTACT: 'fgomezguzman@deloitte.com'
    MEMBERFIRM: 'US'
    PRIMARYCONTACT: 'fgomezguzman@deloitte.com'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'fg28subnetprd'
        id: virtualNetworks_fg28prd_vnet_name_fg28subnetprd.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.KeyVault'
              locations: [
                '*'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_fg28prd_vnet_name_fg28subnetprd 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_fg28prd_vnet_name}/fg28subnetprd'
  properties: {
    addressPrefix: '10.0.0.0/24'
    serviceEndpoints: [
      {
        service: 'Microsoft.KeyVault'
        locations: [
          '*'
        ]
      }
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_fg28prd_vnet_name_resource
  ]
}