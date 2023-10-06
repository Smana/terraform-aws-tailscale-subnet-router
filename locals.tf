resource "random_pet" "prefix" {}

locals {
  prefix = var.name != null ? var.name : random_pet.prefix.id

  tags = {
    app         = "tailscale",
    environment = var.env
  }
}
