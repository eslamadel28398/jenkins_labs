provider "aws" {
  region     = "us-west-2"

}

# Key Pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmt1ysaXC+xB+mIxztiSVfRrccVuEjc5Q1sEtmEXkH1FAhoNdC559G5HxQI05t80boY0GbUNSAJHGixKTBur27zLb4UgWyJKsNipiPZvPxA/weUN69DKZlkmJQAeOn2+LBYAXpzDJVvbb51rSwCuH+IqFSajb4qcRFXgA46zdAgzCplccdWIQ0A+K+JWrxjzCxfMhw8u1nXZU0blR7Cqwd9pMiGu2a8w9P51G6Zb70tKQrH891PP07d0cs4+YhpkbfIGwPbUpN3LkXN7PeFFE+bp9PVM+pUuUxlWtlJd9lekAT3qOLT/u/txRuGJJniqtxMdwll+ehVaEESJIRD2pgJBbiVfMFpYlN9mriRX+iebyIU8n7mXqlmSxzXZc6vYXGFr+zqMX4RMGNoIfJZ8tIxYsMSUYlP9H5lDkip+d8V3j5MScIfJjYVoOCjlmAN+MHnThvhioQ+tnNdaWxumUOI1M4py03pIBSvKj//wBCi/mgIexgNcOm1HaLDJ4/a6U= eslam@localhost.localdomain" # Replace with your public key
}

resource "aws_security_group" "public_sg" {
  name   = "public_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_sg"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name      = aws_key_pair.my_key_pair.key_name

  tags = {
    Name = "HelloWorld"
  }
}


output "instance_ip" {
  value = aws_instance.web.public_ip
}
