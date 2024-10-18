variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "gogs"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  default     = 2
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name"
  default     = "64bit Amazon Linux 2 v3.11.2 running Go 1"
}