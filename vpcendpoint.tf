resource "aws_vpc_endpoint" "vpc1_ssm_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ssm_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "vpc1_ssm_messages_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ssm_messages_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "vpc1_ec2_messages_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ec2_messages_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "vpc2_ssm_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc2.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc2_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc2_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc2_ssm_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "vpc2_ssm_messages_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc2.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc2_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc2_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc2_ssm_messages_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "vpc2_ec2_messages_vpc_endpoint" {
  vpc_id              = aws_vpc.vpc2.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc2_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc2_PrivateSubnet1.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc2_ec2_messages_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id            = aws_vpc.vpc1.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.vpc1_private_route_table.id]
  tags = {
    Name = "vpc1_s3_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "eks_interface" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.eks"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_eks_vpc_endpoint"
  }
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_sts_vpc_endpoint"
  }
}
# resource "aws_vpc_endpoint" "api" {
#   vpc_id              = aws_vpc.vpc1.id
#   service_name        = "com.amazonaws.${var.region}.execute-api"
#   vpc_endpoint_type   = "Interface"
#   security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
#   subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
#   private_dns_enabled = true
#   tags = {
#     Name = "vpc1_api_vpc_endpoint"
#   }
# }
resource "aws_vpc_endpoint" "ec2" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ec2_vpc_endpoint"
  }
}
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ec2_vpc_endpoint"
  }
}
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_ec2_vpc_endpoint"
  }
}
resource "aws_vpc_endpoint" "vpc1_lambda" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.lambda"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet3.id, aws_subnet.vpc1_PrivateSubnet4.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_lambda_vpc_endpoint"
  }
}
# resource "aws_vpc_endpoint" "vpc1_cfn" {
#   vpc_id              = aws_vpc.vpc1.id
#   service_name        = "com.amazonaws.${var.region}.cloudformation"
#   vpc_endpoint_type   = "Interface"
#   security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
#   subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
#   private_dns_enabled = true
#   tags = {
#     Name = "vpc1_cfn_vpc_endpoint"
#   }
# }
resource "aws_vpc_endpoint" "vpc1_elb" {
  vpc_id              = aws_vpc.vpc1.id
  service_name        = "com.amazonaws.${var.region}.elasticloadbalancing"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc1_vpcendpoint_sg.id]
  subnet_ids          = [aws_subnet.vpc1_PrivateSubnet1.id, aws_subnet.vpc1_PrivateSubnet2.id]
  private_dns_enabled = true
  tags = {
    Name = "vpc1_elb_vpc_endpoint"
  }
}
