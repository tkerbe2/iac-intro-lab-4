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