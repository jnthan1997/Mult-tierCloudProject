resource "aws_eip" "elastic-ip" {

    domain = "vpc"

    tags = {
      Name = "Elastic IP"
    }
  
}

resource "aws_nat_gateway" "vpc-nat" {
    subnet_id = aws_subnet.public-subnet-az1.id
    allocation_id = aws_eip.elastic-ip.id

    tags = {
      Name = "VPC NAT Gateway"
    }
  
}