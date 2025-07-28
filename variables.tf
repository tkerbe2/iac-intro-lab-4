#=========================#
# Variables Declared Here #
#=========================#

# Enter a valid region here or the default of us-east-1 will be applied.
# Note that if you look at Terraform.tfvars we have a validation condition for this so only the following regions are allowed:
# us-east-1, us-east-2, us-west-1, us-west-2.

region      = "us-east-2"
environment = "Prod"
org         = "tkdev"


# Go to https://cidr.xyz/ for subnet help.
cidr-block  = "192.168.200.0/22"

# This is a map of string with a key value pair. We use this map to associate our region with an abbreviated region code.
# If you go to the locals.tf file you can see me utilize the lookup() function to retrieve a region code based on our region we assign above.
region-codes = {
    us-east-1 = "ue1"
    us-east-2 = "ue2"
    us-west-1 = "uw1"
    us-west-2 = "uw2"
}