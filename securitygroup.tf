resource "aws_security_group" "bastion-sg" {
    vpc_id = aws_vpc.project-VPC.id
    description = "jump server sg"

    ingress {
        description = "HTTP"
        protocol = "TCP"
        from_port = 80
        to_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    
    ingress {
        description = "HTTPS"
        protocol = "TCP"
        from_port = 443
        to_port = 443
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    
    ingress {
        description = "SSH"
        protocol = "TCP"
        from_port = 22
        to_port = 22
        cidr_blocks = [ "124.104.46.231/32" ]
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
  
    }
}

resource "aws_security_group" "frontend-sg" {

    vpc_id = aws_vpc.project-VPC.id
    description = "Front End Security Group"

    ingress {
        description = "SSH"
        protocol = "TCP"
        to_port = 22
        from_port = 22
        security_groups = [ aws_security_group.bastion-sg.id ]
    }

    ingress {
        description = "HTTP"
        protocol = "TCP"
        to_port = 80
        from_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "HTTPS"
        protocol = "TCP"
        to_port = 443
        from_port = 443
        cidr_blocks = [ "0.0.0.0/0" ]
    }

      egress {

        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
  
    }
  
}

resource "aws_security_group" "backend-sg" {

    vpc_id = aws_vpc.project-VPC.id
    description = "Back-End Security Group"

    ingress {
        description = "SSH"
        protocol = "TCP"
        to_port = 22
        from_port = 22
        security_groups = [ aws_security_group.bastion-sg.id ]
    }

    ingress {
        description = "nodejs port"
        protocol = "TCP"
        to_port = 3000
        from_port = 300
        security_groups = [ aws_security_group.frontend-sg.id ]
    }

      egress {

        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
  
    }
  
}

## Security Group for ALB

resource "aws_security_group" "alb_sg" {
    vpc_id = aws_vpc.project-VPC.id

    ingress {
        protocol = "TCP"
        from_port = 80
        to_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
    }

      egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}