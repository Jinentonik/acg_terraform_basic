### linux pub 1 ###
resource "aws_lb_target_group" "tg_linux_ec2" {
  name        = "tg-linux-ec2"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc1.id
  target_type = "instance"
  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "tg_dash_intranet_uatez" {
  target_group_arn = aws_lb_target_group.tg_linux_ec2.arn
  target_id        = aws_instance.vpc1_pubs1_linux_ec2.id
  port             = 80
  depends_on = [aws_instance.vpc1_pubs1_linux_ec2]
}

resource "aws_lb" "alb_linux_ec2" {
  name               = "alb-vpc1-linux"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vpc1_ec2_sg1.id]
  subnets            = [aws_subnet.vpc1_PublicSubnet1.id, aws_subnet.vpc1_PublicSubnet2.id]
  
}
resource "aws_lb_listener" "alb_linux_ec2_forward" {
  load_balancer_arn = aws_lb.alb_linux_ec2.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_linux_ec2.arn
  }
}
### linux pub 2 ###
resource "aws_lb_target_group" "tg_linux_ec2_ip" {
  name        = "tg-linux-ec2-ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc1.id
  target_type = "ip"
  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "tg_linux_ec2_ip" {
  target_group_arn = aws_lb_target_group.tg_linux_ec2_ip.arn
  target_id        = aws_instance.vpc1_pubs2_linux_ec2.private_ip
  port             = 80
  depends_on = [aws_instance.vpc1_pubs1_linux_ec2]
}

resource "aws_lb" "alb_linux_ec2_ip" {
  name               = "alb-vpc1-linux-ip"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vpc1_ec2_sg1.id]
  subnets            = [aws_subnet.vpc1_PublicSubnet1.id, aws_subnet.vpc1_PublicSubnet2.id]
  
}
resource "aws_lb_listener" "alb_linux_ec2_forward_ip" {
  load_balancer_arn = aws_lb.alb_linux_ec2_ip.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_linux_ec2_ip.arn
  }
}

