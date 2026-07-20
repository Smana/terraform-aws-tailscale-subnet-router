resource "aws_security_group" "this" {
  description = "Security group for tailscale"
  name        = format("%v-tailscale-%s", local.prefix, var.region)
  tags = merge(
    local.tags,
    var.tags,
    {
      Name             = format("%v-tailscale-%s", local.prefix, var.region)
      tailscale_region = var.region
    }
  )
  vpc_id = var.vpc_id
}

#trivy:ignore:AVD-AWS-0104
resource "aws_vpc_security_group_egress_rule" "default" {
  description       = "Allow all egress from tailscale instances"
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "prometheus_node_exporter" {
  count = var.prometheus_node_exporter_enabled ? 1 : 0

  description       = "Allow prometheus node exporter"
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = data.aws_vpc.this.cidr_block
  from_port         = 9100
  to_port           = 9100
  ip_protocol       = "tcp"
}
