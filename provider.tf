terraform {
  required_version = ">= 0.14.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "provider" {
  type    = string
  default = "digitalocean"
}

provider "digitalocean" {
  token = var.do_token
  region = var.region
  alias = "do"
  count = var.provider == "digitalocean" ? 1 : 0
}

provider "google" {
  credentials = file(var.gcp_credentials_file)
  project     = var.gcp_project
  region      = var.region
  alias = "gcp"
  count = var.provider == "gcp" ? 1 : 0
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
  alias = "aws"
  count = var.provider == "aws" ? 1 : 0
}