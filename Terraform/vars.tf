variable "prefix" {
  description = "The prefix which should be used for all resources created from the template"
}

variable "location" {
  description = "The Azure Region in which all resources created in from the template"
}

variable "vmCount" {
  description = "Number of VM resources to create behind the load balancer"
  default     = 2
  type        = number
}

variable "applicationName" {
  description = "Name of the application to be deployed in the infrastructure"
  type        = string
}

variable "environment"{
description = "Environment of the  application: development,staging,production"
type      = string
}

variable "username"{
  description = "Admin username for the virtual machines"
}
variable "password" {
  description = "Admin password the virtual machines"
}

variable "vmImageResourceGroup"{
 description = "Resource group contianing the image of the Virtual machine" 
}
variable "vmImageName"{
 description = "Name of the vm image" 
}