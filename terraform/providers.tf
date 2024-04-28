# On détermine la version du provider OpenStack à utiliser
terraform {
  required_providers {
    openstack = {
      source = "terraform-providers/openstack"
    }
    ovh = {
      source = "terraform-providers/ovh"
  }
  }
  required_version = ">= 1.0.0"
}

# On demande à Terraform d'utiliser le provider téléchargé à l'instant
provider "openstack" {
  cloud = "appcred"
}

provider "ovh" {
  endpoint            = "ovh-eu"
  application_key     = var.ovh_application_key
  application_secret  = var.ovh_application_secret
  consumer_key        = var.ovh_consumer_key
  
}