variable "environment" {
  description = "Environment Name"
}

variable "region" {
  default = "AWS Region"
}

variable "network_workspace" {
  description = "Network workspace name on Terraform Cloud"
}

variable "deployer_key_name" {
  description = "Deployer Key Name"
}

variable "number_of_app_instances" {
  description = "Number of App servers"
  type        = number
}
