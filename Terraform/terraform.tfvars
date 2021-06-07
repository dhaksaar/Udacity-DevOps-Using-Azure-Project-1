#Customer configurations
#Prefix to use for creating the resources
prefix = "DemoApp"

#Location where the resources has to be deployed 
location = "East US"

#Name of the application deployed 
applicationName = "DemoApp"

#Environment type of the application (dev,test,prod etc)
environment = "development"

#VM Configurations#

#Number of VMs to deploy
vmCount = 2

#Resource group that contains the VM Image
vmImageResourceGroup= "vmImages-rg"

#Name of the Image to use for creating the VM
vmImageName="linuxVMImage"

#Default UserId/Password for the VM
username = "adminuser"
password = "asdl123!"

