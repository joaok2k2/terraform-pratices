locals {

  lambda_path = "${path.module}/../app/lambdas"
  layers_path = "${path.module}/../app/layers/nodejs"
  layer_name  = "joi.zip"
  commom_tags = {
    Project   = "Pratices Terraform"
    Service   = "Serveless Application"
    CreatedAt = "2023-01-22"
    Owner     = "João"
  }
}