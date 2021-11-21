targetScope = 'subscription'

param webAppName string = 'lab2-web-01-49075'
param WebRGname string = 'lab2-rgp-web-01'
param KeyWaultRGname string = 'lab2-rgp-data-01'
param NetRGname string = 'lab2-rgp-net-01'
param location string = 'northeurope'
param AppServicePlanSku string = 'S1'
param linuxFxVersion string = 'node|14-lts'
var AppServicePlanName = toLower('AppServicePlan-${webAppName}')
// param GitUrl string = 'https://github.com/Azure-Samples/nodejs-docs-hello-world'
// param branch string = 'master'
param VnetName string = 'lab2-net-01'
var vnetConfig = {
  NetAddressSpace: '10.0.0.0/16'
  subnet1: {
    name: 'app1'
    addressPrefix: '10.0.1.0/24'
  }
  subnet2: {
    name: 'app2'
    addressPrefix: '10.0.2.0/24'
  }
}

// Resource groups
resource web_rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: WebRGname
  location: location
}

resource keyvault_rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: KeyWaultRGname
  location: location
}

resource net_rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: NetRGname
  location: location
}

// VNETS
module vnet 'vnet.bicep' = {
  name: VnetName
  scope: net_rg
  params:{
    VnetName: VnetName
    location: location
    VnetAddress: vnetConfig.NetAddressSpace
    subnet1Name: vnetConfig.subnet1.name
    subnet1Addr: vnetConfig.subnet1.addressPrefix
    subnet2Name: vnetConfig.subnet2.name
    subnet2Addr: vnetConfig.subnet2.addressPrefix
  }
}

// Service
module app_service_plan 'app_service.bicep' = {
  name: AppServicePlanName
  scope: web_rg
  params: {
    AppServicePlanName: AppServicePlanName
    AppServicePlanSku: AppServicePlanSku
    webAppName: webAppName
    linuxFxVersion: linuxFxVersion
//    GitUrl: GitUrl
//    branch: branch
  }
}
