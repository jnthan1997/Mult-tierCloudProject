## Creating Target Group for Front-end EC2 instance
resource "aws_lb_target_group" "frontend-tg" {

    vpc_id = aws_vpc.project-VPC.id
    target_type = "instance"
    ip_address_type = "ipv4"
    protocol = "HTTP"
    port = 80

    health_check {
      path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"

    }

    tags = {
      Name = "Front end Target Group"
    }

}

resource "aws_lb_target_group_attachment" "frontend-attachment" {
    count = length(aws_instance.fronted-ec2-az1)
    target_group_arn = aws_lb_target_group.frontend-tg.arn
    target_id = aws_instance.fronted-ec2-az1[count.index].id
  
}

## Create Application load balancer to attach in Target group


resource "aws_lb" "frontend-alb" {

    load_balancer_type = "application"
    internal = false
    security_groups = [ aws_security_group.alb_sg.id ]
    subnets = local.public-subnet
    enable_deletion_protection = false

    tags = {
      Name = "Front-end ALB"
    }
}

## Create ALB listener for the Application balancer to listen


resource "aws_lb_listener" "alb-listener" {
    load_balancer_arn = aws_lb.frontend-alb.arn
    port = 80 #port listener
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.frontend-tg.arn
    }
  
}
