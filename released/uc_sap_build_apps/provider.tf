
terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "0.2.0-beta2"
    }
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.50.8"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
  cli_server_url = var.cli_server_url
}

# Get the Cloudfoundry API endpoint
module "cloudfoundry_api" {
  source = "../modules/envinstance-cloudfoundry-apiurl"
  environment_label = var.cf_environment_label
}

// Configuration is described in https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs
provider "cloudfoundry" {
  api_url = module.cloudfoundry_api.api_url
}