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

module "oidc" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/oidc-config-and-provider"
  version = "1.6.2-prerelease.3"

  # installer_role_arn = "arn:aws:iam::301721915996:role/tr-mod/tr-mod-HCP-ROSA-Installer-Role"
  # managed = false

  tags = {
    machin = "truc"
  }
}

output "config_id" {
  value = module.oidc.oidc_config_id
}

output "endpoint_url" {
  value = module.oidc.oidc_endpoint_url
}