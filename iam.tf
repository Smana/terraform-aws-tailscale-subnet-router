resource "aws_iam_role" "tailscale_role" {
  name               = format("%v-tailscale-%s", local.prefix, var.region)
  assume_role_policy = file("${path.module}/iam/assume-role.json")
}

resource "aws_iam_instance_profile" "tailscale_profile" {
  name = format("%v-tailscale-%s", local.prefix, var.region)
  role = aws_iam_role.tailscale_role.name
}

# enable AWS Systems Manager service core functionality
resource "aws_iam_role_policy_attachment" "ssm_worker_nodes" {
  count      = var.ssm_enabled ? 1 : 0
  role       = aws_iam_role.tailscale_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
