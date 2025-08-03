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

resource "aws_vpc" "lab_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {

    # 1.
    # In this tag we use string interpolation to combine our naming name prefix with -vpc at the end to identify the type of resource.
    # Notice I use the same naming convention for the other resources.
    Name        = "${local.name_prefix}-vpc"
    Environment = var.env
  }
}

#=================#
# Subnet Resource #
#=================#

# 2.
# Here we create multiple subnets using the for_each Meta-Argument.
# This allows us to create multiple resources with a single resource block.

resource "aws_subnet" "lab_web_sn" {
count = length(local.availability_zones)

  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, var.borrowed_bits, count.index)
  availability_zone = local.availability_zones[count.index]
  tags = {
    Name        = "${local.name_prefix}-${count.index + 1}-web"
    Environment = var.env
  }
}

#==================#
# Internet Gateway #
#==================#

resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name        = "${local.name_prefix}-web-igw"
    Environment = var.env
  }
}

#=====================#
# Default Route Table #
#=====================#

resource "aws_default_route_table" "lab_default_rt" {
  default_route_table_id = aws_vpc.lab_vpc.default_route_table_id

    route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.lab_igw.id
    }

  tags = {
    Name        = "${local.name_prefix}-web-sn"
    Environment = var.env
  }
}

#=========================#
# Route Table Association #
#=========================#
resource "aws_route_table_association" "rt_a" {
  count          = length(local.availability_zones)
  subnet_id      = aws_subnet.lab_web_sn[count.index].id
  route_table_id = aws_default_route_table.lab_default_rt.id
}