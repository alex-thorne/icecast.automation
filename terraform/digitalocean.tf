resource "digitalocean_droplet" "icecast" {
  provider = digitalocean.do
  image    = var.image
  name     = "icecast-server"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = var.droplet_ssh_keys
  count    = var.provider == "digitalocean" ? 1 : 0
}

resource "digitalocean_droplet" "nginx" {
  provider = digitalocean.do
  image    = var.image
  name     = "nginx-server"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = var.droplet_ssh_keys
  count    = var.provider == "digitalocean" ? 1 : 0
}