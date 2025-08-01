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

# Read notes in numerical order

resource "aws_vpc" "lab-vpc" {
  cidr_block       = var.cidr-block
  instance_tenancy = "default"

  tags = {

    # 1.
    # In this tag we use string interpolation to combine our naming prefix with -vpc at the end to identify the type of resource.
    # Notice I use the same naming convention for the other resources.
    Name        = "${local.prefix}-vpc"
    Environment = var.environment
  }
}

#=================#
# Subnet Resource #
#=================#

# 2.
# Here we create multiple subnets using the for_each Meta-Argument.
# This allows us to create multiple resources with a single resource block.

resource "aws_subnet" "lab-web-sn" {
 for_each = var.az-list  
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = cidrsubnet(var.cidr-block, 5, {var.sn_incrementer + 1})
  availability_zone           = "${var.region}${each.key}"
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
    Name        = "${local.prefix}-web-sn"
    Environment = var.environment
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
    Name        = "${local.prefix}-web-sn"
    Environment = var.environment
  }
}