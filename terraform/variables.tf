variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

variable "gcp_credentials_file" {
  type        = string
  description = "Path to GCP credentials file"
}

variable "gcp_project" {
  type        = string
  description = "GCP Project ID"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "region" {
  type        = string
  description = "Region to create the resources in"
  default     = "nyc3"
}

variable "image" {
  type        = string
  description = "Image to use for the droplets"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_ssh_keys" {
  type        = list(string)
  description = "List of SSH key fingerprints to enable in the droplet"
}