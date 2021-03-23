resource "aws_instance" "jenkins" {

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.sg-jenkins.id]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id

}

resource "aws_security_group" "sg-jenkins" {
  name        = "jenkins"
  description = "jenkins security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
