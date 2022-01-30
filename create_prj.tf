resource "digitalocean_project" "prj-01" {
  name        = "prj-01"
  description = "Test Project"
  purpose     = "Create VPN"
  environment = "Development"
}