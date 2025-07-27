#===========================#
# Local Values Defined Here #
#===========================#

# Here we are going to create a name prefix with our other variables and you can see how this makes the code more dynamic.

locals {

region-code = lookup(var.region-codes, var.region, var.region)

# This prefix combines other variables and separates them with a "-" so that it can be used in our resource blocks dynamically.
# This allows us to keep a consistent name for all of our resources and tags without changing them individually.
prefix = "${var.org}"-"${local.region-code}"-"${var.environment}"

}