data "aws_availability_zones" "availability_zones" {}


resource "aws_subnet" "public-subnet-az1" {
    cidr_block = "192.168.1.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.availability_zones.names[0]

    tags = {
      Name = "Front-web IP public subnet"
    }
  
}

resource "aws_subnet" "private-subnet-az1" {
    cidr_block = "192.168.2.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_customer_owned_ip_on_launch = false
    availability_zone = data.aws_availability_zones.availability_zones[0]

    tags = {
      Name = "App IP private-subnet"
    }
  
}