# Account Management
## Log in to Azure
az account login

## Verify Account
az account show

## Set Account
az account set --name {SUBSCRIPTION_ID}


# Validation
az bicep build --file main.bicep


# Deployment
## Test Deployment with What-If
az deployment sub what-if --location westeurope --template-file .\main.bicep --parameters .\main.parameters.json --name ($(Get-Date -Format yyMMddhhmmss)+'-test')

## Create Deployment
az deployment sub create --location westeurope --template-file .\main.bicep --parameters .\main.parameters.json --name ($(Get-Date -Format yyMMddhhmmss)+'-test')


# AVM Templates
## Resource Group
https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/resources/resource-group

## Static Web App
https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/web/static-site