variable "vpc_name" {
}

variable "service_name" {
}

variable "region" {
  default = "us-east-2"
}

variable "app_port" {
}

variable "env" {
}

variable "image" {
}

variable "public_subnets" {
  type = map(any)
  default = {
    av_zone_1 = {
      cidr = "10.0.0.0/28",
      az   = "us-east-2a"
    },
    av_zone_1 = {
      cidr = "10.0.0.32/28",
      az   = "us-east-2b"
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    av_zone_1 = {
      cidr = "10.0.0.16/28",
      az   = "us-east-2a"
    },
    av_zone_1 = {
      cidr = "10.0.0.48/28",
      az   = "us-east-2b"
    }
  }
}

data "aws_caller_identity" "current" {}

locals {
  nat_gateway_az = "av_zone_1"
  default_tags = {
    env     = var.env
    service = var.service_name
  }
  ecs_execution_role = "arn:aws:iam::${data.aws_caller_identity.current.id}:role/ecs-execution"
}