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

locals {
  source = "terraform-redhat/rosa-hcp/rhcs"
  version = "1.6.2-prerelease.3"
}
