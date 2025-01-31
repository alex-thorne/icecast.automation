data "digitalocean_droplet" "existing_droplet" {
  name = "icecast-server"
  most_recent = true
}

resource "digitalocean_droplet" "icecast_server" {
    count = length(data.digitalocean_droplet.existing_droplet.id) == 0 ? 1 : 0
    image     = "ubuntu-20-04-x64"
    name      = "icecast-server"
    region    = "nyc3"
    size      = "s-1vcpu-1gb"
    ssh_keys = [
        data.digitalocean_ssh_key.terraform.id
    ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
}