resource "digitalocean_droplet" "vm-lon1-vpn-1" {
  name   = "vm-lon1-vpn-1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "lon1"
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

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update"
    ]
  }
}

resource "digitalocean_project" "prj-01" {
  name        = "prj-01"
  description = "Test Project"
  purpose     = "Create VPN"
  environment = "Development"
  resources   = [digitalocean_droplet.vm-lon1-vpn-1.urn]
}
