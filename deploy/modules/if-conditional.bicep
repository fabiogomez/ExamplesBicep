var environmentConfigurationMap = {
  Production: {
    enableLogging: true
  }
  Test: {
    enableLogging: false
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-03-01-preview' = if (environmentConfigurationMap[environmentType].enableLogging) {
  name: logAnalyticsWorkspaceName
  location: location
}

resource cosmosDBAccountDiagnostics 'Microsoft.Insights/diagnosticSettings@2017-05-01-preview' = if (environmentConfigurationMap[environmentType].enableLogging) {
  scope: cosmosDBAccount
  name: cosmosDBAccountDiagnosticSettingsName
  properties: {
    workspaceId: logAnalyticsWorkspace.id
    // ...
  }
}
