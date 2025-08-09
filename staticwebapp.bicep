

param staticWebAppName string
param location string

// param githubRepoUrl string = 'https://github.com/Faosis/public-website'
// param branch string = 'main'
// param customDomain string = 'moore-it.cloud'


resource staticWebApp 'Microsoft.Web/staticSites@2024-11-01' = {
  name: staticWebAppName
  location: location
  sku: 'Free'
  }

@description('Create a static web app')
module swa 'br/public:avm/res/web/static-site:0.3.0' = {
  name: 'client'
  scope: resourceGroup()
  params: {
    name: staticWebAppName
    location: location
    sku: 'Free'
  }
}

@description('Output the default hostname')
output endpoint string = swa.outputs.defaultHostname

@description('Output the static web app name')
output staticWebAppName string = swa.outputs.name
