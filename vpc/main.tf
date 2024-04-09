# Create VPC resource
resource "aws_vpc" "jegbu_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "jegbu_vpc"
  }
}