resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  tags: {
    CostCenter: 'Marketing'
    DataClassification: 'Public'
    Owner: 'WebsiteTeam'
    Environment: 'Production'
  }
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


param tags object = {
  CostCenter: 'Marketing'
  DataClassification: 'Public'
  Owner: 'WebsiteTeam'
  Environment: 'Production'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  tags: tags
}

resource appServiceApp 'Microsoft.Web/sites@2020-06-01' = {
  tags: tags
}
