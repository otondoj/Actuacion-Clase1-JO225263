
#----VPC----#
resource "aws_vpc" "vpc_jo_225263" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "vpc_jo_225263"
  }
}

#----GATEWAY----#
resource "aws_internet_gateway" "gateway_jo_225263" {
  vpc_id = aws_vpc.vpc_jo_225263.id
}

#----SUBNET----#
resource "aws_subnet" "vpc_subnet_jo_225263" {
  vpc_id     = aws_vpc.vpc_jo_225263.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "VPC US-East-1a"
  }
}

#----ROUTE TABLE----#
resource "aws_default_route_table" "route_table_jo_225263" {
  default_route_table_id = aws_vpc.vpc_jo_225263.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_jo_225263.id
  }

  tags = {
    Name = "route_table_jo_225263"
  }
}
