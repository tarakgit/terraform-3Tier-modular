output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

# for RDS

output "private_subnet_ids" {
  value = [aws_subnet.private_1.id,aws_subnet.private_2.id]
}


output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

