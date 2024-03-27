@description('The name of the environment. This must be prod, test or dev')
@allowed(
  [
    'prod'
    'test'
    'dev'
  ]
)
param environment string
param location string = resourceGroup().location

var storageName = '${environment}${uniqueString(subscription().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
