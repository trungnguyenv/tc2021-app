terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = "trungnguyenv"
    workspaces = {
      name = var.network_workspace
    }
  }
}

module "ec2" {
  source = "./ec2"

  environment       = var.environment
  deployer_key_name = var.deployer_key_name
  public_subnet_id  = data.terraform_remote_state.network.outputs.public_subnet_id
  security_groups = [
    data.terraform_remote_state.network.outputs.default_security_group_id,
    data.terraform_remote_state.network.outputs.www_security_group_id,
    data.terraform_remote_state.network.outputs.private_access_security_group_id
  ]
}
