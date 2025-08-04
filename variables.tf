
# VPC

variable "vpc_cidr" {}
variable "public_subnet_cidr" {}

variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}

variable "availability_zone1" {}
variable "availability_zone2" {}

variable "env" {}


#EC2

variable "ami_id" {}
variable "instance_type" {}
#variable "key_name" {} its system generated and not being passed with tf.vars in main.tf
variable "project" {}


# RDS

variable "db_instance_class" {}
variable "db_storage" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
#variable "db_subnet_group_name" {} Because this value is not meant to be provided by the user. but passed in root module db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
#variable "rds_security_group" {} Not passing from tfvars ,it directly asigned in root main.tf  security_group_id = module.vpc.rds_sg_id

