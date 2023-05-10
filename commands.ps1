New-AzResourceGroupDeployment `
  -TemplateFile modules\app-service.bicep `
  -environmentType nonprod `
  -ResourceGroupName "bicep-test" `
  -appServiceAppName "fg28-appname" `
  -storageAccountName "stgfg28" `
  -processOrderQueueName "queuefg28"

  New-AzResourceGroupDeployment `
  -TemplateFile key-vaults.bicep `
  -TemplateParameterFile key-vaults.parameters.dev.json `
  -ResourceGroupName "bicep-test"

  New-AzResourceGroupDeployment `
  -TemplateFile key-vaults.bicep `
  -TemplateParameterFile key-vaults.parameters.dev.json `
  -ResourceGroupName "bicep-test" `
  -WhatIf

  New-AzResourceGroupDeployment `
  -TemplateFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\CentralUs\prd\main.bicep `
  -TemplateParameterFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\CentralUs\prd\ame.parameters.prd.json `
  -ResourceGroupName "bicep-test-prd" `
  -WhatIf

  #deploy registry
  az deployment group create --resource-group "bicep-test" --template-file registry.bicep 


  
  #publish module
  az bicep publish --file D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\networking\main.bicep --target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/networking:1.0.0 
  az bicep publish --file D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\keyvaults\main.bicep --target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/keyvaults:1.0.0


  az acr show --resource-group "bicep-test" --name acrza66tl3ac6laq --query loginServer