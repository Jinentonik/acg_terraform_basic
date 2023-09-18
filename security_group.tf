# locals {
#   eks_cluster_sg_id = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
# }

resource "aws_security_group" "vpc1_vpcendpoint_sg" {
  vpc_id = aws_vpc.vpc1.id
  name   = "vpc1_vpcendpoint_sg"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc1_PrivateSubnet1.cidr_block, aws_subnet.vpc1_PrivateSubnet2.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc1_vpcendpoint_sg"
  }
}

resource "aws_security_group" "vpc2_vpcendpoint_sg" {
  vpc_id = aws_vpc.vpc2.id
  name   = "vpc2_vpcendpoint_sg"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc2_PrivateSubnet1.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc1_vpcendpoint_sg"
  }
}

resource "aws_security_group" "vpc1_ec2_sg1" {
  vpc_id = aws_vpc.vpc1.id
  name   = "vpc1_ec2_sg1"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc1_ec2_sg1"
  }
}
resource "aws_security_group" "vpc1_ec2_sg2" {
  vpc_id = aws_vpc.vpc1.id
  name   = "vpc1_ec2_sg2"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc1_ec2_sg2"
  }
}

resource "aws_security_group" "vpc2_ec2_sg1" {
  vpc_id = aws_vpc.vpc2.id
  name   = "vpc2_ec2_sg1"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc2_ec2_sg1"
  }
}

resource "aws_security_group" "eks_cluster" {
  vpc_id = aws_vpc.vpc1.id
  name   = "SG-eks-cluster"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc2_ec2_sg1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "eks_cluster" {
  security_group_id = aws_security_group.eks_cluster.id
  # security_group_id            = local.eks_cluster_sg_id
  description                  = "Access from vpc1 ps1 instance"
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.vpc1_ec2_sg1.id
  depends_on                   = [aws_security_group.vpc1_ec2_sg1]
}