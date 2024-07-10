output "instance_publicIP" {
  description = "EC2 instance public IP"
  value = aws_instance.myec2vm.public_ip
}

output "instance_publicDNS" {
  description = "EC2 instance public DNS"
  value = aws_instance.myec2vm.public_dns
}