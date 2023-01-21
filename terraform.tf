terraform {
  # set TF_CLOUD_ORGANIZATION and TF_WORKSPACE as environment variables to use this from CLI
  cloud {}

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
