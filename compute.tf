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
 for_each = var.az-list
  ami                         = data.aws_ami.amzn_linux.id
  instance_type               = var.instance-type
  subnet_id                   = aws_subnet.lab-web-sn[each.key].id
  user_data                   = file("./bootstrap.sh")

  tags = {
    
    # Here we are adding our naming convention to the VM name and then adding the key from the looping mechanism.
    Name        = "${local.prefix}-web-vm-${each.key}"

    # This will use our environment variable as a tag.
    Environment = var.environment
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

# This will claim a random AWS owned public IP and assign it to our account.

resource "aws_eip" "lab-web-eip" {

# This assigns the EIP assign to our EC2 instance in the code block above.
 for_each = var.az-list  
  
  instance = aws_instance.lab-web-vm[each.key].id
  domain   = "vpc"
}