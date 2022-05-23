locals {
  service_name = "diag-upload-service"
  env          = "prod"
}

provider "aws" {
  region  = "us-east-2"
}

module "service" {
  source = "../../modules/fargate_service"

  service_name = local.service_name
  env          = local.env
  image        = ""
  app_port     = 8000
  vpc_name       = "main"
}