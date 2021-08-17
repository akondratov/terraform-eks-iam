terraform {
  required_providers {
    aws = {
      version = "~> 3.45.0"
    }
    helm = {
      version = "~> 2.2.0"
    }
    kubernetes = {
      version = "~> 2.3.2"
    }
    local = {
      version = "~> 2.1.0"
    }
  }
  required_version = "~> v0.15.3"
}