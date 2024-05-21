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

module "operator_roles" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/operator-roles"
  version = "1.6.2"
  
  oidc_endpoint_url = "oidc.os1.devshift.org/2bgv9kpq2o8lteqg5mvq657bsr1t8gi6"
  operator_role_prefix = "tr-mod"
  path = "/tr-mod/"
  permissions_boundary = ""

  tags = {
    machin = "truc"
  }
}

output "arns" {
  value = module.operator_roles.operator_roles_arn
}