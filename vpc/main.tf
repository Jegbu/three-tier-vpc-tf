# Create VPC resource
resource "aws_vpc" "jegbu_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "jegbu_vpc"
  }
}