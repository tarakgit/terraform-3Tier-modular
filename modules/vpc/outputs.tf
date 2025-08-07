#

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

# Ec2 specific

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

#you do not need to output the IGW and route table unless you explicitly need to use them in the root module or other modules.


# for RDS

output "private_subnet_ids" {
  value = [aws_subnet.private_1.id,aws_subnet.private_2.id]
}


output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

