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

data "aws_ami" "amazon_linux_2" {
 most_recent = true
 owners      = ["amazon"]

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

#=======================#
# EC2 Instance Resource #
#=======================#

resource "aws_instance" "lab_web_vm" {
# 1.
# The count Meta-Argument creates a loop based on a whole number.
# In this example I give it our variable az-list.
# az-list is a map with a key and a value.
# az-list has 2 items so it will create 2 resources here.
  count                       = length(local.availability_zones)
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.lab_web_sn[count.index].id
  user_data                   = file("./bootstrap.sh")
  security_groups             = [aws_security_group.web_servers_sg.id]

  tags = {
    
    # 2.
    # In this tag we use string interpolation to combine our naming prefix with -vpc at the end to identify the type of resource.
    # Notice I use the same naming convention for the other resources and we're calling local instead of var. 
    # Calling local means we're calling from the local block which is in our locals.tf file.
    Name        = "${local.name_prefix}-web-vm-${count.index + 1}"
                    # tkdev-use2-dev-web-vm-1
                    # tkdev-use2-dev-web-vm-2
    # This will use our environment variable as a tag.
    Environment = var.env
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

# 3. 
# This will claim a random AWS owned public IP and assign it to our account.

resource "aws_eip" "lab_web_eip" {

# This assigns the EIP assign to our EC2 instance in the code block above.
 count = length(local.availability_zones)
  
  instance = aws_instance.lab_web_vm[count.index].id
  domain   = "vpc"
}