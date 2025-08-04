


resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.env}-ec2"
    Proj = "${var.project}"
  }
}

