metadata name = 'Deployment of a Static Web App'
metadata description = 'This module deploys a Resource Group and a Static Web App.'


targetScope = 'subscription'


@description('The name of the resource group that will contain the static web app.')
param resourceGroupName string
@description('The location of the resource group and the static web app.')
param location string
@description('The name of the static web app.')
param staticWebAppName string
@description('The SKU of the static web app.')
param sku string
@description('The provider of the static web app.')
param provider string
@description('The branch of the static web app.')
param branch string
@description('The repository URL of the static web app.')
param repositoryUrl string
@description('The repository token of the static web app. This is a secure string.')
@secure()
param repositoryToken string


module resourceGroupModule 'modules/Microsoft.Resources/ResourceGroup/main.bicep' = {
  scope: subscription()
  name: 'modResourceGroup'
  params: {
    name: resourceGroupName
    location: location
  }
}

module staticWebAppModule 'modules/Microsoft.Web/StaticSite/main.bicep' = {
  scope: resourceGroup(resourceGroupName)
  name: 'modStaticWebApp'
  dependsOn: [
    resourceGroupModule
  ]
  params: {
    name: staticWebAppName
    sku: sku
    location: location
    provider: provider
    branch: branch
    repositoryUrl: repositoryUrl
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: '/src'
      apiLocation: ''
      outputLocation: '/'
      skipGithubActionWorkflowGeneration: true
    }
  }
}
