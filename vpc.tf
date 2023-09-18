resource "aws_vpc" "vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
    # "kubernetes.io/cluster/vpc1" = "shared"
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block           = "173.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc2"
  }
}

# resource "aws_vpc" "vpc3" {
#   cidr_block           = "172.0.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "vpc3"
#   }
# }

resource "aws_vpc_peering_connection" "vpc1_vpc2_peering" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
  tags = {
    Name = "vpc1_vpc2_peering"
  }
}
# resource "aws_vpc_peering_connection" "vpc1_vpc3_peering" {
#   vpc_id      = aws_vpc.vpc1.id
#   peer_vpc_id = aws_vpc.vpc3.id
#   auto_accept = true
#   tags = {
#     Name = "vpc1_vpc3_peering"
#   }
# }

resource "aws_route_table" "vpc1_public_route_table" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "VPC1 Public Route Table"
  }
}
resource "aws_route_table" "vpc1_private_route_table" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "VPC1 Private Route Table"
  }
}

resource "aws_route_table" "vpc2_route_table" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name = "VPC2 Route Table"
  }
}

# resource "aws_route_table" "vpc3_route_table" {
#   vpc_id = aws_vpc.vpc2.id

#   tags = {
#     Name = "VPC2 Route Table"
#   }
# }

resource "aws_route" "vpc1_to_vpc2" {
  route_table_id            = aws_route_table.vpc1_private_route_table.id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2_peering.id
}

resource "aws_route" "vpc2_to_vpc1" {
  route_table_id            = aws_route_table.vpc2_route_table.id
  destination_cidr_block    = aws_vpc.vpc1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2_peering.id
}

# resource "aws_route" "vpc1_to_vpc3" {
#   route_table_id            = aws_route_table.vpc1_route_table.id
#   destination_cidr_block    = aws_vpc.vpc3.cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc3_peering.id
# }

# resource "aws_route" "vpc3_to_vpc1" {
#   route_table_id            = aws_route_table.vpc3_route_table.id
#   destination_cidr_block    = aws_vpc.vpc1.cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc3_peering.id
# }
resource "aws_route" "vpc3_to_internet" {
  route_table_id         = aws_route_table.vpc1_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1.id
}