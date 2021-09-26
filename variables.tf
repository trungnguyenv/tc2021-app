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
