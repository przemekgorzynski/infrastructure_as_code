param VnetName string
param location string
param VnetAddress string
param subnet1Name string
param subnet1Addr string
param subnet2Name string
param subnet2Addr string

resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: VnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        VnetAddress
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Addr
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Addr
        }
      }

    ]
  }
}
