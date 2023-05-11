terraform {
  required_version = "=1.0.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM
module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

# ECR
module "ecr" {
  source     = "./modules/ecr"
  image_name = var.image_name
  app_name   = var.app_name
}

# Null Resource
module "after_ecr" {
  source     = "./modules/bash"
  region     = var.region
  image_name = var.image_name
}

# network
module "network" {
  source   = "./modules/network"
  app_name = var.app_name
}

# elb
module "elb" {
  source               = "./modules/elb"
  app_name             = var.app_name
  main-vpc-id          = module.network.main-vpc-id
  elb-sg-id            = module.network.elb-sg-id
  subnet-group-id-list = module.network.subnet-group-id-list
  traffic_distribution = var.traffic_distribution
}

# ECS
module "ecs" {
  source               = "./modules/ecs"
  app_name             = var.app_name
  app-sg-id            = module.network.app-sg-id
  subnet-group-id-list = module.network.subnet-group-id-list
  ecs-iam-role-arn     = module.iam.ecs-iam-role-arn
  elb-tg-blue-arn      = module.elb.elb-tg-blue-arn
  elb-tg-green-arn     = module.elb.elb-tg-green-arn
  image_name           = var.image_name
}

# codepipeline
module "codepipeline" {
  source                  = "./modules/codepipeline"
  app_name                = var.app_name
  image_name              = var.image_name
  elb-tg-blue-name        = module.elb.elb-tg-blue-name
  elb-tg-green-name       = module.elb.elb-tg-green-name
  listener-main-arn       = module.elb.listener-main-arn
  ecs-cluster-name        = module.ecs.ecs-cluster-name
  ecs-service-name        = module.ecs.ecs-service-name
  ecs-task-definition-arn = module.ecs.ecs-task-definition-arn
}
