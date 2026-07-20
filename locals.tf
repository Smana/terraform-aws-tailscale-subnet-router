resource "random_pet" "prefix" {}

locals {
  prefix = var.name != null ? var.name : random_pet.prefix.id
  name   = format("%v-tailscale-%s", local.prefix, var.region)

  tags = {
    app         = "tailscale",
    environment = var.env
  }
  all_tags = merge(local.tags, var.tags)
}
