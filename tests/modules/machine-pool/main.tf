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

module "mp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/machine-pool"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "np0"
  openshift_version = "4.14.23"

  aws_node_pool = {
    instance_type = "m5.xlarge"
    tags = {}
  }

  subnet_id = "subnet-0a977fdb961ab154f"
  autoscaling = {
    enabled = true
    min_replicas = 1
    max_replicas = 3
  }
  # replicas = 2
  auto_repair = false
  labels = {
    l1="v1"
    l2 = "v3"
  }
  taints = [
    {
      key = "t1"
      value = "v1"
      schedule_type = "NoExecute"
    }
  ]
}
