# Create VPC resource
resource "aws_vpc" "jegbu_vpc" {
  cidr_block       = "10.0.0.0/16"
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

# Create public subnet AZ1
resource "aws_subnet" "public_subnet_az_1" {
  vpc_id     = aws_vpc.jegbu_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet AZ1"
  }
}

# Create public subnet AZ2
resource "aws_subnet" "public_subnet_az_2" {
  vpc_id     = aws_vpc.jegbu_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public Subnet AZ2"
  }
}

# Create private subnet AZ1
resource "aws_subnet" "private_subnet_az_1" {
  vpc_id     = aws_vpc.jegbu_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet AZ1"
  }
}

# Create private subnet AZ2
resource "aws_subnet" "private_subnet_az_2" {
  vpc_id     = aws_vpc.jegbu_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private Subnet AZ2"
  }
}

#NACL for public subnet AZ 1
resource "aws_network_acl" "NACL_1" {
  vpc_id = aws_vpc.jegbu_vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.1.0/24"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.1.0/24"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "AZ 1 NACL"
  }
}