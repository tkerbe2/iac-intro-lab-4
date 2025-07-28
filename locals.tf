#===========================#
# Local Values Defined Here #
#===========================#

# Here we are going to create a name prefix with our other variables and you can see how this makes the code more dynamic.

locals {

# This reads as the following.
# We are creating a local variable called region-code and assigning it the value of the output of this lookup function.
# The lookup function looks at the map of string key/pair values using our region variable as the key.
# Since our region is a valid key in that map, it will return it's value.
region-code = lookup(var.region-codes, var.region, var.region)


# This prefix combines other variables and separates them with a "-" so that it can be used in our resource blocks dynamically.
# This allows us to keep a consistent name for all of our resources and tags without changing them individually.
# Notice we're also wrapping our variable and name with "${}" This is string interpolation. 
# Using "${}" forces Terraform to evaluate the expression between the curly braces and convert the result to string.
# The result will looking something like this: tkdev-ue1-prod
prefix = "${var.org}"-"${local.region-code}"-"${var.environment}"


}