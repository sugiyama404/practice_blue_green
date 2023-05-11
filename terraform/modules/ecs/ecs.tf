resource "aws_ecs_cluster" "app-cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = "${var.app_name}-cluster"
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
