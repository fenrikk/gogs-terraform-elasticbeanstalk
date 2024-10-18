variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "eb_sg_id" {
  description = "ID of the Elastic Beanstalk security group"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name"
  type        = string
}