variable "app_name" {
  type = string
}
variable "main-vpc-id" {
  type = string
}

variable "elb-sg-id" {
  type = string
}
variable "subnet-group-id-list" {
  type = list(string)
}

variable "traffic_distribution" {
  type = string
}

locals {
  traffic_dist_map = {
    blue = {
      blue  = 100
      green = 0
    }
    blue-90 = {
      blue  = 90
      green = 10
    }
    split = {
      blue  = 50
      green = 50
    }
    green-90 = {
      blue  = 10
      green = 90
    }
    green = {
      blue  = 0
      green = 100
    }
  }
}
