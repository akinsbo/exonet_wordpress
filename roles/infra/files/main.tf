terraform {
  required_version = ">= 0.12"
}

module "prod" {
  #  this should point to 'master' branch
  source = "./envs/prod/core"

}
