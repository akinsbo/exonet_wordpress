# module "test" {
#   #  this should point to 'olaolu-dev' branch
#   source = "git::https://MACHINE-USER:MACHINE-PASS@github.com/username"
# }
terraform {
  required_version = ">= 0.12"
}

module "prod" {
  #  this should point to 'master' branch
  source = "./envs/prod/core"

}
