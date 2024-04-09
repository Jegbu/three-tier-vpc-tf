# Create VPC resource
resource "aws_vpc" "jegbu_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "jegbu_vpc"
  }
}

# Create internet gateway resource attached to VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.jegbu_vpc.id

  tags = {
    Name = "jegbu_igw"
  }
}