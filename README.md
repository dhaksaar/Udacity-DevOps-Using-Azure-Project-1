# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.
![image](https://user-images.githubusercontent.com/24310615/120940796-ecbdc600-c716-11eb-8825-fc9f2e7dd1c4.png)


### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

1.Setup the Environment

a.Login to Azure CLI and get the subscription id, tenant details
Store them as environment variables ARM_SUBSCRIPTION_ID and ARM_TENANT_ID

b.Store the service principle details (Client ID and Client Secret) as environment variables ARM_CLIENT_ID and ARM_TENANT_ID


2.Create Azure Policy
Create a policy called "tagging-policy" to restrict creation of indexed resources without tags 
View the policy using the below command
```sh
az policy assignment list
```
The policy would be displayed as below
![image](https://user-images.githubusercontent.com/24310615/120957349-68d30080-c74d-11eb-9bf4-84867112653f.png)

3.Create a Resource Group vmImages-rg to store the packer vm image
```sh
az group create -l "eastus" -n vmImages-rg
```

4.Build the packer image
a.Modify the server.json file if there is any change required on the VM image.
The image is set to create an Ubuntu Server with SKU 18.04-LTS and starts a http service on port 8080

b.Run the below command . This step could take a while to complete 
```sh
packer build Packer/server.json
```
Once the command is successully executed, a virtual machine image will be created in the Resource Group "vmImages-rg"


5.Deploy infrastructure using Terraform
a.The terraformvars.tf file contains the variable values. Modify them as per the infrastructure requirement
The below variables can be modified 
  prefix : Prefix to use for creating the resources
  location : Location where the resources has to be deployed
  applicationName : Name of the application deployed 
  environment : Environment type of the application (dev,test,prod etc)
  vmCount : Number of VMs to deploy
  vmImageResourceGroup : Resource group that contains the VM Image
  vmImageName : Name of the Image to use for creating the VM
  username : Default Admin UserId for the VM
  password : Default Admin Password for the VM

b.Run the Terraform plan command
```sh
terraform plan -out solution.plan
```

c.Run the Terraform apply command
```sh
terraform apply "solution.plan"
```

d.Destroy the environment using the Terraform destory command
```sh
terraform destroy
```
