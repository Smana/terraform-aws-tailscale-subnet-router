resource "aws_security_group" "this" {
  description = "Security group for tailscale"
  name        = format("%v-tailscale-%s", local.prefix, var.region)
  tags = merge(
    {
      name = format("%v-tailscale-%s", local.prefix, var.region)
    },
    {
      tailscale_region = var.region
    },
    var.tags,
    local.tags
  )
  vpc_id = var.vpc_id
}

#tfsec:ignore:aws-vpc-no-public-egress-sgr
resource "aws_security_group_rule" "default_egress" {
  description       = "Allow all egress from tailscale instances"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "prometheus_node_exporter" {
  description       = "Allow prometheus node exporter"
  type              = "ingress"
  from_port         = 9100
  to_port           = 9100
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.this.cidr_block]
  security_group_id = aws_security_group.this.id
}
