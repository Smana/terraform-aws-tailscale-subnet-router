resource "aws_launch_template" "this" {
  name_prefix   = format("%v-tailscale-%s", local.prefix, var.region)
  image_id      = data.aws_ami.this.id
  instance_type = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.tailscale_profile.name
  }

  metadata_options {
    http_tokens = "required"
  }

  vpc_security_group_ids = [aws_security_group.this.id]

  user_data = data.cloudinit_config.tailscale_cloud_init.rendered

  dynamic "tag_specifications" {
    for_each = toset(var.resources_to_tag)
    content {
      resource_type = tag_specifications.key
      tags          = merge(local.tags, var.tags)
    }
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = 20
      volume_type           = "gp3"
      delete_on_termination = "true"
      encrypted             = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.subnet_ids

  name             = format("%v-tailscale-%s", local.prefix, var.region)
  max_size         = var.autoscaling.max
  min_size         = var.autoscaling.min
  desired_capacity = var.autoscaling.min

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }

  tag {
    key                 = "name"
    value               = format("%v-tailscale-%s", local.prefix, var.region)
    propagate_at_launch = "true"
  }
  tag {
    key                 = "Name"
    value               = format("%v-tailscale-%s", local.prefix, var.region)
    propagate_at_launch = "true"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }
}
