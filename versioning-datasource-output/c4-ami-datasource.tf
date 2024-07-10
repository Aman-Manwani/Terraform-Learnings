data "aws_ami" "amzlinux2" {
  most_recent = true

  owners = ["amazon"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }

  filter {
    name = "name"
    values = ["al2023-ami-2023.3.*x86_64"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
