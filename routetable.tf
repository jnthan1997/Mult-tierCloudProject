resource "aws_route_table" "public-rt-1" {

    vpc_id = aws_vpc.project-VPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc-ig.id
    }

    tags = {
      Name = "Public Route Table"
    }
  
}


## Route Table Associate
resource "aws_route_table_association" "assoc-rt-1" {
    subnet_id = aws_subnet.public-subnet-az1.id
    route_table_id = aws_route_table.public-rt-1.id

}

resource "aws_route_table_association" "assoc-rt-2" {
    subnet_id = aws_subnet.public-subnet-az2.id
    route_table_id = aws_route_table.public-rt-1.id
}

resource "aws_route_table_association" "assoc-rt-3" {
    subnet_id = aws_subnet.bastion-host.id
    route_table_id = aws_route_table.public-rt-1.id
}

##Private Route Table for private subnet

resource "aws_route_table" "private-rt" {

    vpc_id = aws_vpc.project-VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.vpc-nat.id
    }

    tags = {
      Name = "Private Route Table"
    }
  
}

resource "aws_route_table_association" "private-rt-assoc" {
    subnet_id = aws_subnet.private-subnet-az1.id
    route_table_id = aws_route_table.private-rt.id
  
}
resource "aws_route_table_association" "private-rt-assoc2" {

    subnet_id = aws_subnet.private-subnet-az2.id
    route_table_id = aws_route_table.private-rt.id
  
}