variable "app_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "elb-tg-blue-name" {
  type = string
}

variable "elb-tg-green-name" {
  type = string
}

variable "listener-main-arn" {
  type = string
}

variable "ecs-cluster-name" {
  type = string
}

variable "ecs-service-name" {
  type = string
}

data "aws_caller_identity" "self" {}

variable "ecs-task-definition-arn" {
  type = string
}
