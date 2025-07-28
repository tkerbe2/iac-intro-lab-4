#==============#
# VPC Resource #
#==============#

resource "aws_vpc" "lab-vpc" {
  cidr_block       = var.cidr-block
  instance_tenancy = "default"

  tags = {

    # In this tag we use string interpolation to combine our naming prefix with -vpc at the end to identify the type of resource.
    # Notice I use the same naming convention for the other resources.
    Name        = "${local.prefix}-vpc"
    Environment = var.environment
  }
}

#=================#
# Subnet Resource #
#=================#

# Here we create a single subnet for our VM to live in.

resource "aws_subnet" "lab-web-sn" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = cidrsubnet(var.cidr-block, 2, )

  tags = {
    Name        = "${local.prefix}-web-sn"
    Environment = var.environment
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