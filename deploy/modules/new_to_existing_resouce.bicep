resource server 'Microsoft.Sql/servers@2020-11-01-preview' existing = {
  name: serverName
}
//child
resource database 'Microsoft.Sql/servers/databases@2020-11-01-preview' = {
  parent: server
  name: databaseName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' existing = {
  name: 'toydesigndocs'
}
#extensions
resource lockResource 'Microsoft.Authorization/locks@2016-09-01' = {
  scope: storageAccount
  name: 'DontDelete'
  properties: {
    level: 'CanNotDelete'
    notes: 'Prevents deletion of the toy design documents storage account.'
  }
}


resource applicationInsights 'Microsoft.Insights/components@2018-05-01-preview' existing = {
  name: applicationInsightsName
}

resource functionApp 'Microsoft.Web/sites@2020-06-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  properties: {
    siteConfig: {
      appSettings: [
        // ...
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights.properties.InstrumentationKey
        }
      ]
    }
  }
}

//access to properties to exisiting resource
resource applicationInsights 'Microsoft.Insights/components@2018-05-01-preview' existing = {
  name: applicationInsightsName
}

resource functionApp 'Microsoft.Web/sites@2020-06-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  properties: {
    siteConfig: {
      appSettings: [
        // ...
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights.properties.InstrumentationKey
        }
      ]
    }
  }
}

//access to secret keys to exisiting resource
resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' existing = {
  name: storageAccountName
}

resource functionApp 'Microsoft.Web/sites@2020-06-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  properties: {
    siteConfig: {
      appSettings: [
        // ...
        {
          name: 'StorageAccountKey'
          value: storageAccount.listKeys().keys[0].value
        }
      ]
    }
  }
}
