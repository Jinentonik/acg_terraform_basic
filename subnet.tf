resource "aws_subnet" "vpc1_PrivateSubnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "vpc1_PrivateSubnet1"
    # "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = false
}

resource "aws_subnet" "vpc1_PrivateSubnet2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "vpc1_PrivateSubnet2"
    # "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = false
}
resource "aws_subnet" "vpc1_PrivateSubnet3" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "vpc1_PrivateSubnet3"
    # "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = false
}

resource "aws_subnet" "vpc1_PrivateSubnet4" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "vpc1_PrivateSubnet4"
    # "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = false
}
resource "aws_subnet" "vpc1_PublicSubnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "vpc1_PublicSubnet1"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = true
}
resource "aws_subnet" "vpc1_PublicSubnet2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "vpc1_PublicSubnet2"
  }
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc2_PrivateSubnet1" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "173.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                              = "vpc2_PrivateSubnet1"
    "kubernetes.io/role/internal-elb" = "1"
  }

  map_public_ip_on_launch = false
  # route_table_id          = aws_route_table.vpc1_route_table.id
  # depends_on = [
  #     aws_route_table.vpc2_route_table
  # ]
}

resource "aws_route_table_association" "vpc1_ps1_rt" {
  subnet_id      = aws_subnet.vpc1_PrivateSubnet1.id
  route_table_id = aws_route_table.vpc1_private_route_table.id
}

resource "aws_route_table_association" "vpc1_ps2_rt" {
  subnet_id      = aws_subnet.vpc1_PrivateSubnet2.id
  route_table_id = aws_route_table.vpc1_private_route_table.id
}
resource "aws_route_table_association" "vpc1_ps3_rt" {
  subnet_id      = aws_subnet.vpc1_PrivateSubnet3.id
  route_table_id = aws_route_table.vpc1_private_route_table.id
}

resource "aws_route_table_association" "vpc1_ps4_rt" {
  subnet_id      = aws_subnet.vpc1_PrivateSubnet4.id
  route_table_id = aws_route_table.vpc1_private_route_table.id
}

resource "aws_route_table_association" "vpc1_pubs1_rt" {
  subnet_id      = aws_subnet.vpc1_PublicSubnet1.id
  route_table_id = aws_route_table.vpc1_public_route_table.id
}

resource "aws_route_table_association" "vpc2_ps1_rt" {
  subnet_id      = aws_subnet.vpc2_PrivateSubnet1.id
  route_table_id = aws_route_table.vpc2_route_table.id
}
