resource "aws_ecr_repository" "repository" {
  name         = var.image_name
  force_delete = true
  #image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.app_name}-repository"
  }
}
