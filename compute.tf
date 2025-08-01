#                                   _        _    __ 
#                                  | |      | |  / _|
#    ___ ___  _ __ ___  _ __  _   _| |_ ___ | |_| |_ 
#   / __/ _ \| '_ ` _ \| '_ \| | | | __/ _ \| __|  _|
#  | (_| (_) | | | | | | |_) | |_| | ||  __/| |_| |  
#   \___\___/|_| |_| |_| .__/ \__,_|\__\___(_)__|_|  
#                      | |                           
#                      |_|                           

#=================#
# Filter for AMI  #
#=================#

# Read notes in numerical order

data "aws_ami" "amzn_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
#=======================#
# EC2 Instance Resource #
#=======================#

resource "aws_instance" "lab-web-vm" {
# 1.
# The for_each Meta-Argument creates a loop based on a map or set of strings provided. 
# In this example I give it our variable az-list.
# az-list is a map with a key and a value.
# az-list has 2 items so it will create 2 resources here.
 for_each = var.az-list
  ami                         = data.aws_ami.amzn_linux.id
  instance_type               = var.instance-type
  subnet_id                   = aws_subnet.lab-web-sn[each.key].id
  user_data                   = file("./bootstrap.sh")

  tags = {
    
    # 2.
    # In this tag we use string interpolation to combine our naming prefix with -vpc at the end to identify the type of resource.
    # Notice I use the same naming convention for the other resources and we're calling local instead of var. 
    # Calling local means we're calling from the local block which is in our locals.tf file.
    Name        = "${local.prefix}-web-vm-${each.key}"

    # This will use our environment variable as a tag.
    Environment = var.environment
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

# 3. 
# This will claim a random AWS owned public IP and assign it to our account.

resource "aws_eip" "lab-web-eip" {

# This assigns the EIP assign to our EC2 instance in the code block above.
 for_each = var.az-list  
  
  instance = aws_instance.lab-web-vm[each.key].id
  domain   = "vpc"
}