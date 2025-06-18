terraform {
  required_version = "~> 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.2"
    }
  }
}
