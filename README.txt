name: Terraform Build and Deploy Workflow
trigger: none
pool: My-Agent

stages:
  - stage:
    displayName: Terraform Build
    jobs:
      - job:
        displayName: Terraform Plan
        steps:
          - task: TerraformTaskV4@4
            displayName: Terraform Init
            inputs:
              provider: 'azurerm'
              command: 'init'
              workingDirectory: 'codebase1/Codebase/terraform_machine'
              backendServiceArm: 'My-service-connection'
              backendAzureRmResourceGroupName: 'terraform-rg-01'
              backendAzureRmStorageAccountName: 'statefilestg4563'
              backendAzureRmContainerName: 'statefile'
              backendAzureRmKey: 'terraform.tfstate'
          - task: TerraformTaskV4@4
            displayName: Terraform Validate
            inputs:
              provider: 'azurerm'
              command: 'validate'
              workingDirectory: 'codebase1/Codebase/terraform_machine'

          - task: TerraformTaskV4@4
            displayName: Terraform Plan
            inputs:
              provider: 'azurerm'
              command: 'plan'
              workingDirectory: 'codebase1/Codebase/terraform_machine'
              environmentServiceNameAzureRM: 'My-service-connection'

  - stage: 
    displayName: Terraform Apply
    jobs:
      - job: 
        displayName: Terraform Deploy
        steps:
        - task: TerraformTaskV4@4
          inputs:
            provider: 'azurerm'
            command: 'init'
            workingDirectory: 'codebase1/Codebase/terraform_machine'
            backendServiceArm: 'My-service-connection'
            backendAzureRmResourceGroupName: 'terraform-rg-01'
            backendAzureRmStorageAccountName: 'statefilestg4563'
            backendAzureRmContainerName: 'statefile'
            backendAzureRmKey: 'terraform.tfstate'
        - task: TerraformTaskV4@4
          inputs:
            provider: 'azurerm'
            command: 'apply'
            workingDirectory: 'codebase1/Codebase/terraform_machine'
            environmentServiceNameAzureRM: 'My-service-connection'

  - stage: 
    displayName: Terraform Destroy
    jobs:
      - job: 
        displayName: Terraform Destroy
        steps:
          - task: TerraformTaskV4@4
            inputs:
              provider: 'azurerm'
              command: 'init'
              workingDirectory: 'codebase1/Codebase/terraform_machine'
              backendServiceArm: 'My-service-connection'
              backendAzureRmResourceGroupName: 'terraform-rg-01'
              backendAzureRmStorageAccountName: 'statefilestg4563'
              backendAzureRmContainerName: 'statefile'
              backendAzureRmKey: 'terraform.tfstate'

          - task: TerraformTaskV4@4
            displayName: Terraform Destroy Plan
            inputs:
              provider: 'azurerm'
              command: 'plan'
              workingDirectory: 'codebase1/Codebase/terraform_machine'
              environmentServiceNameAzureRM: 'My-service-connection'
          - task: TerraformTaskV4@4
            displayName: Terraform Destroy
            inputs:
              provider: 'azurerm'
              command: 'destroy'
              workingDirectory: 'codebase1/Codebase/terraform_machine'
              environmentServiceNameAzureRM: 'My-service-connection'
