resource "aws_lb_target_group" "blue" {
  name        = "${var.app_name}-blue-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.main-vpc-id

  health_check {
    interval            = 300
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 120
    unhealthy_threshold = 10
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group" "green" {
  name        = "${var.app_name}-green-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.main-vpc-id

  health_check {
    interval            = 300
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 120
    unhealthy_threshold = 10
    matcher             = "200-299"
  }
}
