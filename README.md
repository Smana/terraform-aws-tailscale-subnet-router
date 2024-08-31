# Tailscale subnet router

This module allows to provision EC2 instances (part of an Autoscaling group) in order to access to private AWS resources using [Tailscale](https://tailscale.com/)

![Subnet router](.assets/subnet_router.png)

## ✔️ Prerequisites

In order for your instances to join automatically your `Tailnet` at startup, you need to:

* [Generate an auth key](https://tailscale.com/kb/1085/auth-keys/?q=auth%20key) or use the Tailscale provider ([here](/examples/with_provider/) is an example)
* Add an [autoApprovers](https://tailscale.com/kb/1018/acls/#auto-approvers-for-routes-and-exit-nodes) ACL so that the routes will be advertised.
  Here is an example that allows an instance that uses an auth_key generated by the user `foo@example.com` to automatically advertise the CIDR `10.0.0.0/16`

```hcl
  "autoApprovers": {
      "routes": {
          "10.0.0.0/16": [
              "foo@example.com"
          ]
      }
  },
```

## :rocket: Deploy

Set the appropriate variables in `variables.tfvars`

```hcl
module "tailscale_subnet_router" {
  source  = "Smana/tailscale-subnet-router/aws"
  version = "1.0.6"
  region = "eu-west-3"
  env    = "dev"

  name     = "foobar"
  auth_key = <REDACTED> # Put your tailscale auth_key here

  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnets
  advertise_routes = [module.vpc.vpc_cidr_block]

  tags = {
    app                         = "tailscale"
    observability:node-exporter = "true"
  }
}
```

And run the following command
```console
tofu plan --var-file variables.tfvars
```

After checking the plan, apply it:
```console
tofu apply --var-file variables.tfvars
```

## 🔍 CI

Run the following command in order to check the code before pushing a PR.

```console
task pre-commit
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | ~> 2.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.65.0 |
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.3.4 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.tailscale_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.tailscale_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_worker_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.default_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.prometheus_node_exporter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_pet.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [cloudinit_config.tailscale_cloud_init](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advertise_routes"></a> [advertise\_routes](#input\_advertise\_routes) | List of CIDR blocks that are routed through Tailscale | `list(string)` | n/a | yes |
| <a name="input_ami_filter"></a> [ami\_filter](#input\_ami\_filter) | List of maps used to create the AMI filter for the action runner AMI. | `map(list(string))` | <pre>{<br>  "name": [<br>    "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"<br>  ]<br>}</pre> | no |
| <a name="input_ami_owner"></a> [ami\_owner](#input\_ami\_owner) | Owner ID of the AMI | `string` | `"099720109477"` | no |
| <a name="input_auth_key"></a> [auth\_key](#input\_auth\_key) | Tailscale auth key used to join the tailnet | `string` | `""` | no |
| <a name="input_autoscaling"></a> [autoscaling](#input\_autoscaling) | Autoscaling configuration | <pre>object({<br>    min = number<br>    max = number<br>  })</pre> | <pre>{<br>  "max": 2,<br>  "min": 1<br>}</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | Environment of the Tailscale instances | `string` | `""` | no |
| <a name="input_extra_args"></a> [extra\_args](#input\_extra\_args) | Additionnal arguments to append to the tailscale commmand line | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3a.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Prefix for the autoscaling group | `string` | `null` | no |
| <a name="input_prometheus_node_exporter_enabled"></a> [prometheus\_node\_exporter\_enabled](#input\_prometheus\_node\_exporter\_enabled) | If set to true install and start a prometheus node exporter | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the AWS Region | `string` | n/a | yes |
| <a name="input_resources_to_tag"></a> [resources\_to\_tag](#input\_resources\_to\_tag) | list of resources we want to tag on aws\_launch\_template | `list(string)` | <pre>[<br>  "instance",<br>  "volume"<br>]</pre> | no |
| <a name="input_ssm_enabled"></a> [ssm\_enabled](#input\_ssm\_enabled) | If set to true install and start the AWS SSM agent | `bool` | `false` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Private subnet IDs where the Tailscale instances will be created | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags for all the resources | `map(string)` | `{}` | no |
| <a name="input_tailscale_ssh_enabled"></a> [tailscale\_ssh\_enabled](#input\_tailscale\_ssh\_enabled) | If true Tailscale will be started with SSH support | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the Tailscale instances will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_id"></a> [autoscaling\_group\_id](#output\_autoscaling\_group\_id) | value |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | value |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
