resource "aws_vpc" "project-VPC" {

    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "Web Tier VPC"
    }
  
}

resource "aws_internet_gateway" "vpc-ig" {

    vpc_id = aws_vpc.project-VPC.id

    tags = {
      Name = "VPC Internet Gateway"
    }
  
}