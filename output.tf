output "bastion-public-ip" {
    value = aws_instance.ec2-jumpserver.public_ip
  
}
output "frontend-public-ip" {
    value = aws_instance.fronted-ec2-az1.public_ip
}
output "backend-public_ip" {
    value = aws_instance.backend-ec2-az1.public_ip
  
}
output "fronted-vpc-ip" {
    value = aws_instance.fronted-ec2-az1.private_ip
  
}
output "backend-vpc-ip" {
    value = aws_instance.backend-ec2-az1.private_ip
  
}