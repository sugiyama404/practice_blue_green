variable "app-sg-id" {
  type = string
}

variable "subnet-group-id-list" {
  type = list(string)
}

variable "ecs-iam-role-arn" {
  type = string
}

variable "app_name" {
  type = string
}

variable "elb-tg-blue-arn" {
  type = string
}

variable "elb-tg-green-arn" {
  type = string
}

variable "image_name" {
  type = string
}

data "aws_caller_identity" "self" {}
