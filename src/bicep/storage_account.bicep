// Creates a storage account, private endpoints and DNS zones
@description('Azure region of the deployment')
param location string = 'west europe'

@description('storage account name')
param storage_account_name string = 'st${uniqueString(resourceGroup().name)}'

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storage_account_name
  location: location
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
  }
  sku: {
    name: 'Standard_LRS'
  }
}


//output storageId string = storage.id
