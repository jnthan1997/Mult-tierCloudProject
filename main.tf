resource "aws_instance" "ec2-jumpserver" {

    ami = "ami-01938df366ac2d954"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.bastion-host.id
    vpc_security_group_ids = [ aws_security_group.bastion-sg.id ]
    key_name = aws_key_pair.ssh-key.id

    tags = {
      Name = "Bastion Host"
    }
  
}

resource "aws_instance" "fronted-ec2-az1" {

    count = 2
    ami = "ami-01938df366ac2d954"
    instance_type = "t2.micro"
    subnet_id = element(local.public-subnet, count.index)
    vpc_security_group_ids = [ aws_security_group.frontend-sg.id ]
    key_name = aws_key_pair.ssh-key.id
    user_data = file("nginx.sh")

    tags = {
      Name = "Front End EC2"
    }
  
}

resource "aws_instance" "backend-ec2-az1" {
    ami = "ami-01938df366ac2d954"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private-subnet-az1.id
    vpc_security_group_ids = [ aws_security_group.backend-sg.id ]
    key_name = aws_key_pair.ssh-key.id

    tags = {
      Name = "Back End EC2"
    }
  
}
