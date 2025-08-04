#VPC

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"

private_subnet_1_cidr  = "10.0.2.0/24"
private_subnet_2_cidr  = "10.0.3.0/24"

availability_zone1   = "us-east-1a"
availability_zone2   = "us-east-1c"
env                 = "dev"

#EC2
ami_id         = "ami-0c02fb55956c7d316"  # Example: Amazon Linux 2 (us-east-1)
instance_type  = "t2.micro"
#key_name not required as generating the key inside Terraform in main.tf key_name = aws_key_pair.generated_key.key_name
project        = "MacDolly"


#RDS 

db_instance_class    = "db.t3.micro"
db_storage           = 20
db_name              = "myappdb"
db_user              = "admin"
db_password          = "StrongPassword123!"
#db_subnet_group_name = "my-subnet-group"    will be passed from root
#rds_security_group   = "sg-0123456789abcdef0"

