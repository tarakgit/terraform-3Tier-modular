
# variables for VPC / Public /Private subnet
variable "cidr_block" {}
variable "public_subnet_cidr" {}

variable "availability_zone1" {}
variable "availability_zone2" {}
variable "env" {}

variable "private_subnet_1_cidr" {
  description = "CIDR for private subnet"
  type        = string
}

variable "private_subnet_2_cidr" {}

