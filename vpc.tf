#==============#
# VPC Resource #
#==============#


# Go to https://cidr.xyz/ for help.
# I forgot to create the VPC resource but it should be below.
# Check out the registry for how to create it
# https://registry.terraform.io/
# It should use a /23 RFC1918 private IP space of anything in the 10.0.0.0/8 space. 
# Use the same tags as the subnet but name it lab-vpc


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

# Add VPC resource local name between the two dots.  
# I know this needs to be the id of the internet gateway.
# To reference a resource you use the following: 
# resource_type.resource_name.id
# I think you can find how to reference it here:

vpc_id = aws_vpc.replace with local name.id

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
    cidr_block = "0.0.0.0/0"

    # Need to reference the IGW I've created above
    # This documentation may help...
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
    gateway_id = 
  }

# I forgot to add tags here.
# I think you could copy and paste the same tags from the subnet block and name this lab-igw.
# Remember the tag name is what you will see in AWS - it's just a way to organize your resources.
# All resources in AWS will have a unique ARN. 
# Learn more about ARNs and tags below if you want:
# https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html
# https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html
}