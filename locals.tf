#   _                 _      _    __ 
#  | |               | |    | |  / _|
#  | | ___   ___ __ _| |___ | |_| |_ 
#  | |/ _ \ / __/ _` | / __|| __|  _|
#  | | (_) | (_| (_| | \__ \| |_| |  
#  |_|\___/ \___\__,_|_|___(_)__|_|  
                            

#===========================#
# Local Values Defined Here #
#===========================#

# Read notes in numerical order

# 1.
# Here we are going to create a name prefix with our other variables and you can see how this makes the code more dynamic.
# We use the local block to accomplish this.

locals {

#=============#
# Name Prefix #
#=============#

# 2.
# This prefix combines other variables and separates them with a "-" so that it can be used in our resource blocks dynamically.
# This allows us to keep a consistent name for all of our resources and tags without changing them individually.
# Notice we're also wrapping our variable and name with "${}" This is string interpolation. 
# Using "${}" forces Terraform to evaluate the expression between the curly braces and convert the result to string.
prefix = "${var.org}-${local.region-code}-${var.environment}"



#======================#
# Region Mapping Logic #
#======================#

# 3.
# We are creating a local variable called region-code and assigning it the value of the output of this lookup function.
# The lookup function looks at the map of string key/pair values using our region variable as the key.
# Since our region is a valid key in that map, it will return it's value.
# Additionally our region value default is "us-east-1" so if it's left default then our default region ID is ue1.
region-code = lookup(var.region-codes, var.region, "ue1")



}