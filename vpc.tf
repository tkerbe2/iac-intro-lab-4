#                     _    __ 
#                    | |  / _|
#  __   ___ __   ___ | |_| |_ 
#  \ \ / / '_ \ / __|| __|  _|
#   \ V /| |_) | (__ | |_| |  
#    \_/ | .__/ \___(_)__|_|  
#        | |                  
#        |_|                  

#==============#
# VPC Resource #
#==============#


resource "aws_vpc" "lab_vpc" {
  cidr_block       = "192.168.200.0/23"
  instance_tenancy = "default"

  tags = {
    Name        = "tkdev-use1-dev-vpc"
    Environment = "dev"
  }
}

#=================#
# Subnet Resource #
#=================#

resource "aws_subnet" "lab_web_sn_a" {

  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = "192.168.200.0/28"
  availability_zone = "us-east-1a"
  
  tags = {
    Name        = "tkdev-use1-dev-web-sn-a"
    Environment = "dev"
  }
}

resource "aws_subnet" "lab_web_sn_b" {

  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = "192.168.200.16/28"
  availability_zone = "us-east-1b"
  tags = {
    Name        = "tkdev-use1-dev-web-sn-b"
    Environment = "dev"
  }
}

#==================#
# Internet Gateway #
#==================#

resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name        = "tkdev-use1-dev-igw"
    Environment = "dev"
  }
}

#=====================#
# Default Route Table #
#=====================#

resource "aws_default_route_table" "lab_default_rt" {
  default_route_table_id = aws_vpc.lab_vpc.default_route_table_id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
    }

  tags = {
    Name        = "tkdev-use1-dev-rt"
    Environment = "dev"
  }
}

#=========================#
# Route Table Association #
#=========================#

resource "aws_route_table_association" "rta_a" {

  subnet_id      = aws_subnet.lab_web_sn_a.id
  route_table_id = aws_default_route_table.lab_default_rt.id
}

resource "aws_route_table_association" "rta_b" {

  subnet_id      = aws_subnet.lab_web_sn_b.id
  route_table_id = aws_default_route_table.lab_default_rt.id
}