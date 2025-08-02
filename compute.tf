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

resource "aws_instance" "lab_web_vm_a" {

  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.lab_web_sn_a.id

  tags = {  
    Name        = "tkdev-use1-dev-web-vm-a"
    Environment = "dev"
  }
}

resource "aws_instance" "lab_web_vm_b" {

  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.lab_web_sn_b.id

  tags = {  
    Name        = "tkdev-use1-dev-web-vm-b"
    Environment = "dev"
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

resource "aws_eip" "lab_web_eip_a" {

  instance = aws_instance.lab_web_vm_a.id
  domain   = "vpc"
}

resource "aws_eip" "lab_web_eip_b" {

  instance = aws_instance.lab_web_vm_b.id
  domain   = "vpc"
}