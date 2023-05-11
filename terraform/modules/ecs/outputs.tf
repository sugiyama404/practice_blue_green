output "ecs-cluster-name" {
  value = aws_ecs_cluster.app-cluster.name
}

output "ecs-service-name" {
  value = aws_ecs_service.app-service.name
}

output "ecs-task-definition-arn" {
  value = aws_ecs_task_definition.app-definition.arn
}
