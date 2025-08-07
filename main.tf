module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  availability_zone1  = var.availability_zone1
  availability_zone2 = var.availability_zone2
  env                = var.env
}


module "ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet_id
  key_name       = aws_key_pair.generated_key.key_name
  security_group_id = [module.vpc.ec2_sg_id]  # ✅ attach correct SG  if not assigned it takes the default sg
  env            = var.env
  project        = var.project     # ✅ Add this
}


# key pair for ec2 instance    1) geneerate key,2) lod into aws using aws_key_par module with key-name in aws, 3) download that .pem file into current path

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-generated-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/terraform-key.pem"
  file_permission = "0400"
}


# Subnet groups are required for RDS, so we get subnet id's frm VPC grp them into subnet group and pass them to RDS

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.env}-rds-subnet-group"
  subnet_ids = module.vpc.private_subnet_ids     # ✅ Only 1 private subnet is fine for single-AZ

  tags = {
    Name = "${var.env}-rds-subnet-group"
  }
}


module "rds" {
  source               = "./modules/rds"
  db_instance_class    = var.db_instance_class
  db_storage           = var.db_storage
  db_name              = var.db_name
  db_user              = var.db_user
  db_password          = var.db_password
  #private_subnet_ids = [module.vpc.private_subnet_id]  #private_subnet_id is not used directly by aws_db_instance only subnet grp to determine where to place the database.
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.name   # ✅ Fixed
  security_group_id    = module.vpc.rds_sg_id 
  env                  = var.env
}


