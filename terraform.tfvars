#   _                       __                      _    __                     
#  | |                     / _|                    | |  / _|                    
#  | |_ ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___  | |_| |___   ____ _ _ __ ___ 
#  | __/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \ | __|  _\ \ / / _` | '__/ __|
#  | ||  __/ |  | | | (_| | || (_) | |  | | | | | || |_| |  \ V / (_| | |  \__ \
#   \__\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_(_)__|_|   \_/ \__,_|_|  |___/
                                                                              
#=======================#
# Define Variables Here #
#=======================#

# Read notes in numerical order

# 1.
# Enter a valid region here or the default of us-east-1 will be applied.
# Note that if you look at variables.tf we have a validation condition for this so only the following regions are allowed:
# us-east-1, us-east-2, us-west-1, us-west-2.

region        = "us-east-2"

# 2.
# This environment variable also has a validation condition. You can see this in the variables.tf file.
env           = "dev"

# 3.
# This is just an example of a common naming standard. My org is tkdev. You can create your own if it follows the validation condition.
org_name       = "tkdev"

# 4.
# I am just keeping the instance type t3.micro so it's free. I used this as another example of something you can variabilize.
instance_type = "t3.micro"

# 5.
# Our CIDR block is important and we have to have something vaid from RFC 1918.
# Go to https://cidr.xyz/ for subnet help.
cidr_block    = "192.168.200.0/23"

# 6.
# This is a map of string with a key value pair. We use this map to associate our region with an abbreviated region code.
# If you go to the locals.tf file you can see me utilize the lookup() function to retrieve a region code based on our region we assign above.
region_codes = {
    us-east-1 = "ue1"
    us-east-2 = "ue2"
    us-west-1 = "uw1"
    us-west-2 = "uw2"
}

# 7.
# This list below I've created for some looping mechanisms in compute.tf.
# This is a key value pair with the keys being 0 and 1, where the values are us-east-1 and us-east-2.
availability_zones = {
    0 = "us-east-1a"
    1 = "us-east-1b"
}


# What size of network you want
# 5 is a /28
borrowed_bits = 5