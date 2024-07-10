<<<<<<< HEAD
//creating aws instance
resource "aws_instance" "first-ec2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-practice-EC2"
  }

  // used to attach key pair to an instance
  key_name = aws_key_pair.key-tf.key_name

  // used to attach security groups to an instance
  security_groups = [
    aws_security_group.allow_tls.name
  ]

  // used to run script at the runtime of an instance
  user_data = file("${path.module}/script.sh")

  // syntax to write connection for an provisioner to an instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  # there are three types of provisioners file, local-exec, remote-exec
  # push the local file,folder into the destination provided in the block of provisioner(in the instance) 
  provisioner "file" {
    source      = "${path.module}/temp.txt"
    destination = "/tmp/temp.txt"
  }

  # it runs the command written in the block after the instance is made but in the local shell not in instance shell 
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ${path.root}/hello.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'hello aman manwani' > /tmp/test.txt"
    ]
  }

  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = [var.ami_owner]
  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
=======
//creating aws instance
resource "aws_instance" "first-ec2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-practice-EC2"
  }

  // used to attach key pair to an instance
  key_name = aws_key_pair.key-tf.key_name

  // used to attach security groups to an instance
  security_groups = [
    aws_security_group.allow_tls.name
  ]

  // used to run script at the runtime of an instance
  user_data = file("${path.module}/script.sh")

  // syntax to write connection for an provisioner to an instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  # there are three types of provisioners file, local-exec, remote-exec
  # push the local file,folder into the destination provided in the block of provisioner(in the instance) 
  provisioner "file" {
    source      = "${path.module}/temp.txt"
    destination = "/tmp/temp.txt"
  }

  # it runs the command written in the block after the instance is made but in the local shell not in instance shell 
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ${path.root}/hello.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'hello aman manwani' > /tmp/test.txt"
    ]
  }

  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = [var.ami_owner]
  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
>>>>>>> d22e0d0342898899eef0fecde78332a51fac6aeb
