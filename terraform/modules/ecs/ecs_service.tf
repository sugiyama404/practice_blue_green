resource "aws_ecs_service" "app-service" {
  name            = "${var.app_name}-blue-service"
  cluster         = aws_ecs_cluster.app-cluster.id
  task_definition = aws_ecs_task_definition.app-definition.arn
  desired_count   = 1

  network_configuration {
    security_groups  = [var.app-sg-id]
    subnets          = var.subnet-group-id-list
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.elb-tg-blue-arn
    container_name   = var.image_name
    container_port   = 80
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  lifecycle {
    ignore_changes = [desired_count, task_definition, load_balancer]
  }
}
