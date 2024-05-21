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

module "iam_resources" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/account-iam-resources"
  version = "1.6.2"

  account_role_prefix = "tr-mod"
  path = "/tr-mod/"
  tags = {
    machin = "truc"
  }
  permissions_boundary = ""
}

output "arns" {
  value = module.iam_resources.account_roles_arn
}