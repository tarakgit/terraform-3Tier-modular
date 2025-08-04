resource "aws_db_instance" "default" {
  identifier             = "${var.env}-db"
  engine                 = "mysql"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_storage
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.env}-rds"
  }
}


#A Subnet Group is a named collection of subnet IDs mainly with RDS, ElastiCache.

#resource "aws_db_subnet_group" "rds_subnet_group" {
#  name       = "${var.env}-rds-subnet-group"
#  subnet_ids = [
#    var.private_subnet_id
#  ]

#  tags = {
#    Name = "${var.env}-rds-subnet-group"
#  }
#}


