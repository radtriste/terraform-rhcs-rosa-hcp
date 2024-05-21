terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38.0"
    }
    rhcs = {
      version = "= 1.6.2"
      source  = "terraform-redhat/rhcs"
    }
  }
}

module "vpc" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/vpc"
  version = "1.6.2-prerelease.3"

  name_prefix = "tr-mod"
  availability_zones_count = "3"
  vpc_cidr = "192.168.0.0/16"

  tags = {
    machin = "truc"
  }
}

output "azs" {
  value = module.vpc.availability_zones
}

output "cidr" {
  value = module.vpc.cidr_block
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}