resource "digitalocean_droplet" "vm-lon1-vpn-1" {
  name   = "vm-lon1-vpn-1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "lon1"
}

resource "digitalocean_project" "prj-01" {
  name        = "prj-01"
  description = "Test Project"
  purpose     = "Create VPN"
  environment = "Development"
  resources   = [digitalocean_droplet.vm-lon1-vpn-1.urn]
}
