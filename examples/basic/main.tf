

data "aws_availability_zones" "available" {}

locals {
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  env      = "dev"
  region   = "eu-west-3"
  vpc_cidr = "10.0.0.0/16"
  tags = {
    app         = "tailscale"
    environment = local.env
  }
}

provider "aws" {
  region = "eu-west-3"
}

module "tailscale" {
  source = "../../."

  region = local.region
  env    = local.env

  name     = "foobar"
  auth_key = "tskey-auth-..."

  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnets
  advertise_routes = [module.vpc.vpc_cidr_block]

  tags = local.tags

}

## Supporting resources

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = "vpc-${local.region}-${local.env}"
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  enable_flow_log                      = true
  create_flow_log_cloudwatch_iam_role  = true
  create_flow_log_cloudwatch_log_group = true

  tags = merge(
    local.tags,
    local.tags
  )
}
