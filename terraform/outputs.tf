output "icecast_ip" {
  value = digitalocean_droplet.icecast.ipv4_address
}

output "nginx_ip" {
  value = digitalocean_droplet.nginx.ipv4_address
}