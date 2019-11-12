terraform {
  required_version = ">= 0.12"
}

module "prod" {
  source = "./envs/prod/core"
}
