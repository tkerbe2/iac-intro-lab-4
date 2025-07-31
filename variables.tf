#                   _       _     _            _    __ 
#                  (_)     | |   | |          | |  / _|
#  __   ____ _ _ __ _  __ _| |__ | | ___  ___ | |_| |_ 
#  \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|| __|  _|
#   \ V / (_| | |  | | (_| | |_) | |  __/\__ \| |_| |  
#    \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___(_)__|_|  
                                                    
#=========================#
# Variables Declared Here #
#=========================#

# Enter a valid region here or the default of us-east-1 will be applied.
# Note that if you look at Terraform.tfvars we have a validation condition for this so only the following regions are allowed:
# us-east-1, us-east-2, us-west-1, us-west-2.

region        = "us-east-2"
environment   = "Dev"
org           = "tkdev"

instance-type = "t3.micro"

# Go to https://cidr.xyz/ for subnet help.
cidr-block    = "192.168.200.0/22"

# This is a map of string with a key value pair. We use this map to associate our region with an abbreviated region code.
# If you go to the locals.tf file you can see me utilize the lookup() function to retrieve a region code based on our region we assign above.
region-codes = {
    us-east-1 = "ue1"
    us-east-2 = "ue2"
    us-west-1 = "uw1"
    us-west-2 = "uw2"
}

# This list below I've created for some looping mechanisms in compute.tf.
# This is a key value pair with the keys being a and b, where the values are 1 and 2.
az-list = {
    a = "1"
    b = "2"

}

