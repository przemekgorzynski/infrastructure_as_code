param AppServicePlanSku string
param AppServicePlanName string
param webAppName string
param linuxFxVersion string
// param GitUrl string
// param branch string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: AppServicePlanName
  location: resourceGroup().location
  sku: {
    name: AppServicePlanSku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: resourceGroup().location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
  dependsOn: [
    appServicePlan
  ]
}

// If we would like to deploy custom webpage
// resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
//   name: '${appService.name}/web'
//   properties: {
//     repoUrl: GitUrl
//     branch: branch
//     isManualIntegration: true
//   }
// }
