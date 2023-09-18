resource "aws_internet_gateway" "vpc1" {
    vpc_id = aws_vpc.vpc1.id
    tags = {
        Name = "vpc1_igw"
    }
}