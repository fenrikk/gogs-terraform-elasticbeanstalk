data "aws_secretsmanager_secret" "rds_credentials" {
  name = "rds-gogs-credentials"
}

data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = data.aws_secretsmanager_secret.rds_credentials.id
}

resource "aws_db_instance" "main" {
  identifier             = "${var.project_name}-db"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_name                = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["dbName"]
  username               = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["userName"]
  password               = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["userPassword"]
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.rds_sg_id]
  skip_final_snapshot    = true
  multi_az               = true

  tags = {
    Name = "${var.project_name} Database"
  }
}