# this bucket is create before and table also
terraform {
  backend "s3" {
    bucket         = "terraform-project-state-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

