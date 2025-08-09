param staticWebAppName string
param location string
param githubRepoUrl string = 'https://github.com/Faosis/public-website'
param branch string = 'main'
param customDomain string = 'moore-it.cloud'

resource staticWebApp 'Microsoft.Web/staticSites@2024-11-01' = {
  name: staticWebAppName
  location: location
  sku: {
    name: 'Free'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    repositoryUrl: githubRepoUrl
    branch: branch
    buildProperties: {
      apiLocation: ''
      appLocation: '/'
      outputLocation: 'build'
    }
  }
}

// Optional: custom domain resource, you still need to set validationToken after deployment
resource customDomainResource 'Microsoft.Web/staticSites/customDomains@2022-09-01' = {
  name: '${staticWebApp.name}/${customDomain}'
  properties: {
    validationToken: '' // fill after deployment
  }
  dependsOn: [
    staticWebApp
  ]
}
