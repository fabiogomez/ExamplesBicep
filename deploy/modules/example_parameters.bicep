param appServicePlanSkuName string
param appServicePlanSkuCapacity int
param storageAccountSkuName string
param appServicePlanSku object = {
  name: 'S1'
  capacity: 2
}

@allowed([
  'Production'
  'Test'
])
param environmentType string = 'Test'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
    capacity: appServicePlanSkuCapacity
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountSkuName
  location: location
  sku: {
    name: storageAccountSkuName
  }
}


var environmentConfigurationMap = {
  Production: {
    appServicePlan: {
      sku: {
        name: 'P2V3'
        capacity: 3
      }
    }
    storageAccount: {
      sku: {
        name: 'ZRS'
      }
    }
  }
  Test: {
    appServicePlan: {
      sku: {
        name: 'S2'
        capacity: 1
      }
    }
    storageAccount: {
      sku: {
        name: 'LRS'
      }
    }
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: environmentConfigurationMap[environmentType].appServicePlan.sku
}
