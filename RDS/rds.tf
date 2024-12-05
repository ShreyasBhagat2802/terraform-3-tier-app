# Subnet Group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  description = "Subnet group for RDS instance"
  subnet_ids  = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = "RDS-Sub_Grp_TF"
  }
}

# RDS Instance
resource "aws_db_instance" "rds_instance" {
  identifier             = "myrdsdbtf"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  db_name                = var.rds_name
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.rds_sg_id]
  multi_az               = false
  backup_retention_period = 7
  publicly_accessible    = false

  tags = {
    Name = "RDS-Instance_TF"
  }
  final_snapshot_identifier = "final-snapshot-myrdsdb"
}
