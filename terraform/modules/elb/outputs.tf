output "elb-tg-blue-arn" {
  value = aws_lb_target_group.blue.arn
}

output "elb-tg-green-arn" {
  value = aws_lb_target_group.green.arn
}

output "elb-tg-blue-name" {
  value = aws_lb_target_group.blue.name
}

output "elb-tg-green-name" {
  value = aws_lb_target_group.green.name
}

output "listener-main-arn" {
  value = aws_lb_listener.main.arn
}
