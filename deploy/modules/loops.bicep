var cosmosDBContainerDefinitions = [
  {
    name: 'customers'
    partitionKey: '/customerId'
  }
  {
    name: 'orders'
    partitionKey: '/orderId'
  }
  {
    name: 'products'
    partitionKey: '/productId'
  }
]

resource cosmosDBContainers 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2020-04-01' = [for cosmosDBContainerDefinition in cosmosDBContainerDefinitions: {
  parent: cosmosDBDatabase
  name: cosmosDBContainerDefinition.name
  properties: {
    resource: {
      id: cosmosDBContainerDefinition.name
      partitionKey: {
        kind: 'Hash'
        paths: [
          cosmosDBContainerDefinition.partitionKey
        ]
      }
    }
    options: {}
  }
}]
