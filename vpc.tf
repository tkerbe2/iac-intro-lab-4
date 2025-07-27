#==============#
# VPC Resource #
#==============#

resource "aws_vpc" "lab-vpc" {
  cidr_block       = "10.10.0.0/23"
  instance_tenancy = "default"

  tags = {
    Name        = "lab-1-vpc"
    Environment = "Dev"
  }
}

#=================#
# Subnet Resource #
#=================#

# Here we create a single subnet for our VM to live in.

resource "aws_subnet" "lab-web-sn" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "lab-web-sn"
    Environment = "Dev"
  }
}


#==================#
# Internet Gateway #
#==================#

resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name        = "lab-1-igw"
    Environment = "Dev"
  }
}


#=====================#
# Default Route Table #
#=====================#

resource "aws_default_route_table" "lab-default-rt" {
  default_route_table_id = aws_vpc.lab-vpc.default_route_table_id

    route {
    cidr_block = var.cidr-block
    gateway_id = aws_internet_gateway.lab-igw.id
    }

  tags = {
    Name        = "lab-1-default-rt"
    Environment = "Dev"
  }
}