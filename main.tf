provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  project_name         = var.project_name
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "security" {
  source = "./modules/security"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "database" {
  source = "./modules/database"

  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_subnet_group_name = module.vpc.db_subnet_group_name
  rds_sg_id            = module.security.rds_sg_id
  project_name         = var.project_name
}

module "elastic_beanstalk" {
  source = "./modules/elastic_beanstalk"

  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  eb_sg_id            = module.security.eb_sg_id
  project_name        = var.project_name
  solution_stack_name = var.solution_stack_name
}