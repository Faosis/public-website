// Parameters
param staticWebAppName string = 'public-website-app'
param location string = resourceGroup().location
param githubRepoUrl string = 'https://github.com/Faosis/public-website'
param branch string = 'main'
param githubWorkflowIdentityPrincipalId string // Provide the principalId of the GitHub workflow identity
param customDomain string = 'moore-it.cloud'

// Static Web App resource
resource staticWebApp 'Microsoft.Web/staticSites@2023-06-01-preview' = {
  name: staticWebAppName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    repositoryUrl: githubRepoUrl
    branch: branch
    buildProperties: {
      apiLocation: '' // No API for basic hello world
      appLocation: '/' // Root directory
      outputLocation: 'build' // Adjust if needed
    }
    identity: {
      type: 'UserAssigned'
      userAssignedIdentities: {
        '${githubWorkflowIdentityPrincipalId}': {}
      }
    }
  }
}

// Custom domain resource
resource customDomainResource 'Microsoft.Web/staticSites/customDomains@2022-09-01' = {
  name: '${staticWebApp.name}/${customDomain}'
  properties: {
    validationToken: '' // You will need to retrieve and set the validation token after initial deployment
  }
  dependsOn: [
    staticWebApp
  ]
}
