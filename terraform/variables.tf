variable "digitalocean_token" {
  type        = string
  description = "DigitalOcean API token"
}

variable "droplet_ssh_keys" {
  type        = list(string)
  description = "List of SSH key fingerprints to enable in the droplet"
}