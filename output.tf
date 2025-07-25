output "bastion-public-ip" {
    value = aws_instance.ec2-jumpserver.public_ip
  
}

output "frontend-public_ip" {
    value = [for instance in aws_instance.fronted-ec2-az1 : instance.public_ip]
  
}
output "fronted-vpc-ip" {
    value = local.public-subnet
  
}
output "backend-vpc-ip" {
    value = aws_instance.backend-ec2-az1.private_ip
  
}

output "subnet-id" {
  value = aws_subnet.public-subnet-az1.id
}

output "subnet_id2" {
    value = aws_subnet.public-subnet-az2.id  
}

output "private-subnet-az1" {
    value = aws_subnet.private-subnet-az1.id
  
}

output "private-subnet-az2" {
    value = aws_subnet.private-subnet-az2.id
  
}

output "alb-dns" {
    value = aws_lb.frontend-alb.dns_name
  
}