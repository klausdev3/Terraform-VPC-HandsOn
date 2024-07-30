resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow HTTP, SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress { #inbound traffic
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress { #ssh access from anywhere
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress { #outbound traffic
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}