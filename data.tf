data "aws_vpc" "this" {
  id = var.vpc_id
}

data "aws_ami" "this" {
  most_recent = "true"

  dynamic "filter" {
    for_each = var.ami_filter
    content {
      name   = filter.key
      values = filter.value
    }
  }

  owners = [var.ami_owner]
}

data "cloudinit_config" "tailscale_cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "cloud-init-config.yaml"
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/scripts/cloudinit-config.yaml",
      {},
    )
  }

  part {
    filename     = "init-tailscale.sh"
    content_type = "text/x-shellscript"
    content = templatefile(
      "${path.module}/scripts/startup_script.sh",
      {
        "region"                = var.region
        "env"                   = var.env
        "advertise_routes"      = join(",", var.advertise_routes)
        "auth_key"              = var.auth_key
        "tailscale_ssh_enabled" = var.tailscale_ssh_enabled
        "extra_args"            = var.extra_args
        "prom_exporter_enabled" = var.prometheus_node_exporter_enabled
        "ssm_enabled"           = var.ssm_enabled
      },
    )
  }
}
