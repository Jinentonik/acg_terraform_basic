
resource "aws_instance" "vpc1_pubs1_linux_ec2" {
  ami                    = var.linux_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.vpc1_PublicSubnet1.id
  vpc_security_group_ids = [aws_security_group.vpc1_ec2_sg1.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc1_pubs1_linux_ec2",
    "ops:running-schedule" = "custom-office-hours"
  }
}
resource "aws_instance" "vpc1_pubs2_linux_ec2" {
  ami                    = var.linux_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.vpc1_PublicSubnet1.id
  vpc_security_group_ids = [aws_security_group.vpc1_ec2_sg1.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc1_pubs2_linux_ec2",
    "ops:running-schedule" = "custom-office-hours"
  }
}
resource "aws_instance" "vpc1_pubs1_ec2" {
  ami                    = var.windows_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.vpc1_PublicSubnet1.id
  vpc_security_group_ids = [aws_security_group.vpc1_ec2_sg1.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc1_pubs1_ec2"
  }
}
resource "aws_instance" "vpc1_ps1_ec2" {
  ami                    = var.windows_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.vpc1_PrivateSubnet1.id
  vpc_security_group_ids = [aws_security_group.vpc1_ec2_sg1.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc1_ps1_ec2"
  }
}

resource "aws_instance" "vpc1_ps2_ec2" {
  ami                    = var.windows_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.vpc1_PrivateSubnet2.id
  vpc_security_group_ids = [aws_security_group.vpc1_ec2_sg2.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc1_ps2_ec2"
  }
}

resource "aws_instance" "vpc2_ps1_ec2" {
  ami                    = var.windows_ami
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.vpc2_PrivateSubnet1.id
  vpc_security_group_ids = [aws_security_group.vpc2_ec2_sg1.id]
  iam_instance_profile   = aws_iam_instance_profile.SSM_profile.name
  key_name               = "acg-18092023"
  tags = {
    Name = "vpc2_ps1_ec2"
  }
}