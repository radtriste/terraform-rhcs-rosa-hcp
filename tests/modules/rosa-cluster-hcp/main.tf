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

module "cluster" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/rosa-cluster-hcp"
  version = "1.6.2"

  cluster_name = "tr-mod"
  oidc_config_id = "2bgv9kpq2o8lteqg5mvq657bsr1t8gi6"
  openshift_version = "4.15.10"
  operator_role_prefix = "tr-mod"
  account_role_prefix = "tr-mod"
  path = "/tr-mod/"
  aws_subnet_ids = ["subnet-04b2695e257f5b7f2",  "subnet-0fa97ebfa164bbd7d",   "subnet-0d97d7045541285d7"]
  private = false
  machine_cidr = "192.168.0.0/16"
}
