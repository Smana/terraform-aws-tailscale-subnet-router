variable "name" {
  description = "Prefix for the autoscaling group"
  type        = string
  default     = null
}

variable "region" {
  description = "Name of the AWS Region"
  type        = string
}

variable "env" {
  description = "Environment of the Tailscale instances"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Tailscale instances will be created"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs where the Tailscale instances will be created"
  type        = list(string)
}

variable "advertise_routes" {
  description = "List of CIDR blocks that are routed through Tailscale"
  type        = list(string)
}

variable "auth_key" {
  type        = string
  description = "Tailscale auth key used to join the tailnet"
  default     = ""
}

variable "tags" {
  description = "Default tags for all the resources"
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.micro"
}

variable "autoscaling" {
  description = "Autoscaling configuration"
  type = object({
    min = number
    max = number
  })
  default = {
    min = 1
    max = 2
  }
}

variable "resources_to_tag" {
  type        = list(string)
  default     = ["instance", "volume"]
  description = "list of resources we want to tag on aws_launch_template"
}
