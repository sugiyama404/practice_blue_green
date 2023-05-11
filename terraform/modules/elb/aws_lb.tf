resource "aws_lb" "alb" {
  name                       = "${var.app_name}-alb"
  internal                   = false
  enable_deletion_protection = false
  load_balancer_type         = "application"
  security_groups            = [var.elb-sg-id]
  subnets                    = var.subnet-group-id-list
}
