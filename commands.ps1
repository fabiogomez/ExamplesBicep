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
  -ResourceGroupName "bicep-test-int" `
  -WhatIf

  New-AzResourceGroupDeployment `
  -TemplateFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\CentralUs\int\main.bicep `
  -TemplateParameterFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\CentralUs\int\ame.parameters.int.json `
  -ResourceGroupName "bicep-test-int"

  New-AzResourceGroupDeployment `
  -TemplateFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\EastUs2\dev\main.bicep `
  -TemplateParameterFile D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\EastUs2\dev\ame.parameters.dev.json `
  -ResourceGroupName "bicep-test-dev"

  az bicep decompile --file 

  az bicep build --file D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\AME\CentralUs\prd\main.bicep --outfile hola.json

  #deploy registry
  az deployment group create --resource-group "bicep-test" --template-file registry.bicep 


  
  #publish module
  az bicep publish --file D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\networking\main.bicep --target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/networking:1.0.1 
  az bicep publish --file D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\keyvaults\main.bicep --target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/keyvaults:1.0.1

  Publish-AzBicepModule -FilePath D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\keyvaults\main.bicep -Target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/keyvaults:1.0.0

  Publish-AzBicepModule -FilePath D:\Users\fgomezguzman\Documents\IAC\Bicep\ExamplesBicep\Arch\Modules\networking\main.bicep -Target br:acrza66tl3ac6laq.azurecr.io/bicep/modules/networking:1.0.0
  az acr show --resource-group "bicep-test" --name acrza66tl3ac6laq --query loginServer


  az bicep decompile --file bicep-test-prd.json