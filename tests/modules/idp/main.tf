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

module "idp_htp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "htp-idp"
  idp_type = "htpasswd"
  htpasswd_idp_users = [
    {
      username = "radtriste",
      password = "anything232&^R"
    }
  ]
}

module "gh_htp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "gh-idp"
  idp_type = "github"

  github_idp_client_id = "dsdsdsjnishnfunsgdnfdshgsdfjhdf"
  github_idp_client_secret = "dsdsdsjnishnfunsgdnfdshgsdfjhdf"
  github_idp_organizations = ["openshift"]
}

module "gl_htp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "gl-idp"
  idp_type = "gitlab"

  gitlab_idp_client_id = "dsdsdsjnishnfunsgdnfdshgsdfjhdf"
  gitlab_idp_client_secret = "dsdsdsjnishnfunsgdnfdshgsdfjhdf" 
  gitlab_idp_url =  "https://gitlab.cee.redhat.com"
}

module "go_htp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "go-idp"
  idp_type = "google"

  google_idp_client_id = "dsdsdsjnishnfunsgdnfdshgsdfjhdf"
  google_idp_client_secret = "dsdsdsjnishnfunsgdnfdshgsdfjhdf" 
  google_idp_hosted_domain =  "redhat.com"
}

module "ldp_htp" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
  version = "1.6.2-prerelease.3"

  cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
  name = "ldp-idp"
  idp_type = "ldap"

  ldap_idp_url = "ldap://ldap.forumsys.com/dc=example,dc=com?uid"
  ldap_idp_ca = ""
  
}

# module "oid_htp" {
#   source = "terraform-redhat/rosa-hcp/rhcs//modules/idp"
#   version = "1.6.2-prerelease.3"

#   cluster_id = "2b9md84ql2ho313fogugjjvqert1nioe"
#   name = "oid-idp"
#   idp_type = "openid"
# }