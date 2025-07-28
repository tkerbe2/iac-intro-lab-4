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
  ami                 = data.aws_ami.amzn_linux.id
  instance_type       = "t3.micro"
  subnet_id           = # Need to add subnet with id

  tags = {
    
    # Here we are adding our naming convention to the VM name.
    Name        = "${local.prefix}-web-vm"

    # This will use our environment 
    Environment = var.environment
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

# This will claim a random AWS owned public IP and assign it to our account.

resource "aws_eip" "lab-web-eip" {

# This assigns the EIP assign to our EC2 instance in the code block above.
  instance = aws_instance.lab-web-vm.id
  domain   = "vpc"
}