output "eb_sg_id" {
  description = "ID of the Elastic Beanstalk security group"
  value       = aws_security_group.eb_sg.id
}

output "rds_sg_id" {
  description = "ID of the RDS security group"
  value       = aws_security_group.rds_sg.id
}