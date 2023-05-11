resource "aws_codebuild_project" "main" {
  name         = "${var.app_name}-codebuild"
  description  = "codebuild_project for ${var.app_name}"
  service_role = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "terraform/template/buildspec.yml"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true


    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.self.account_id
    }
    environment_variable {
      name  = "ECR_REPOSITORY"
      value = var.image_name
    }
    environment_variable {
      name  = "ECS_TASK_DEFINITION_ARN"
      value = var.ecs-task-definition-arn
    }
  }
}
