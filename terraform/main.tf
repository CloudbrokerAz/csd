terraform {
  required_providers {
    vra = {
      source  = "local/vmware/vra"
      version = ">= 0.5.1"
    }
  }
  required_version = ">= 0.13"
}

provider vra {
  url           = var.vra_url
  refresh_token = var.vra_refresh_token
}

resource "vra_deployment" "this" {
  name        = "Terraform Deployment"
  description = "Deployed from vRA provider for Terraform."

  blueprint_id      = var.vra_blueoprintId
  project_id        = var.vra_projectId

  inputs = {
    Image           = "ubuntu1804"
    Flavor          = "medium"
    Region          = "region:sydney"
    platform        = "platform:aws"
    applications    = "moad"
    workloadtype    = "function:public"
  }
}