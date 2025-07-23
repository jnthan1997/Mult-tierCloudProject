data "aws_availability_zones" "availability_zones" {}


## Public Subnet for Bastion host

resource "aws_subnet" "bastion-host" {
    cidr_block = "192.168.5.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.availability_zones.names[0]

    tags = {
      Name = "Bastion Host"
    }
  
}

## Public Subnet for A-Z 1
resource "aws_subnet" "public-subnet-az1" {
    cidr_block = "192.168.1.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.availability_zones.names[0]

    tags = {
      Name = "Front-web IP public subnet"
    }
  
}


### Private Subnet for A-Z 1
resource "aws_subnet" "private-subnet-az1" {
    cidr_block = "192.168.2.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.availability_zones.names[0]

    tags = {
      Name = "App IP private-subnet"
    }
  
}


## Public Subnet for A-Z 2
resource "aws_subnet" "public-subnet-az2" {
    cidr_block = "192.168.3.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.availability_zones.names[1]

    tags = {
      Name = "Front-web IP public subnet AZ2"
    }
  
}


### Private Subnet for A-Z 2
resource "aws_subnet" "private-subnet-az2" {
    cidr_block = "192.168.4.0/24"
    vpc_id = aws_vpc.project-VPC.id
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.availability_zones.names[1]

    tags = {
      Name = "App IP private-subnet AZ2"
    }
  
}