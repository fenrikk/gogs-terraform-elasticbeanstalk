output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.database.db_endpoint
}

output "elastic_beanstalk_url" {
  description = "URL of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.eb_cname
}