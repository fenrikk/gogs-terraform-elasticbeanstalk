variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "rds_sg_id" {
  description = "ID of the RDS security group"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}