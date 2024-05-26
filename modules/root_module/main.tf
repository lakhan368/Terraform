resource "aws_instance" "server" {
  count         = 1
  ami           = var.ec2_image
  instance_type = var.ec2_instance_type

  tags          = local.common_tags
}

resource "aws_security_group" "allow_http" {
  name          = "module_security_group"
  description   = "module_security_group"
  vpc_id        = var.ec2_vpc_id

  ingress {
    description = "module_security_group"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "module_security_group"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = local.common_tags 
}

