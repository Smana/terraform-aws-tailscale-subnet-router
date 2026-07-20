config {
  call_module_type = "local"
}
plugin "aws" {
  enabled = true
  version = "0.48.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
