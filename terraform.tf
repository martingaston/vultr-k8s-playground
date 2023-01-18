terraform {
  cloud {
    organization = "productive-beach"

    workspaces {
      name = "vultr-k8s-playground"
    }
  }

  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.12.0"
    }
  }
}

provider "vultr" {
  rate_limit  = 100
  retry_limit = 3
}
