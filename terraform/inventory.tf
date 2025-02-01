resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tmpl",
    {
      icecast_ip = digitalocean_droplet.icecast.ipv4_address
      nginx_ip = digitalocean_droplet.nginx.ipv4_address
    }
  )
  filename = "${path.module}/../ansible/inventory"
}