#                   _       _     _            _    __ 
#                  (_)     | |   | |          | |  / _|
#  __   ____ _ _ __ _  __ _| |__ | | ___  ___ | |_| |_ 
#  \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|| __|  _|
#   \ V / (_| | |  | | (_| | |_) | |  __/\__ \| |_| |  
#    \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___(_)__|_|  
                                                    
#=========================#
# Variables Declared Here #
#=========================#
                                                           
# Read notes in numerical order

# 1.
#------
# What we're doing here is telling Terraform how to treat these variables by specifying the following:
# Data type, validation and conditions, default values, and if the data is sensitive or not. 

#====================#
# Attributes Section #
#====================#


# 2.
#------
# Our first variable is of the type string and we use it to set our region.
variable "region" {
    type        = string
    description = "Used to specify the region to deploy our resources to and apply to naming conventions."

# 3.
#------
# Notice I've set a default for this variable here. This means that if no value is supplied elsewhere -- the default value will be applied.    
    default     = "us-east-1"

#====================#
# Validation Section #
#====================#
# 4.
# Pretend our organization only allows the use of certain regions. We can create a simple validation condition to ensure only those regions are used. 
# Examine the validation condition carefully. Ask yourself what do you think this code is doing? 

# 5.
# lower() is a function that converts string text to lowercase.
# || is the operator for OR.
# == operator returns true if both objects being compared have the same value and same type.
# example 1: "a" == "b" would return false because although they are both strings - their values are different.
# example 2: "a" == "a" would return trube because both are strings and have the same value.

validation {
    condition     = lower(var.region) == "us-east-1" || lower(var.region) == "us-east-2" || lower(var.region) == "us-west-1" || lower(var.region) == "us-west-2"
    error_message = "Not a supported region." 
    }
}

# 6.
# This next variable is used mostly for naming conventions and to identify what type of environment we are deplying resources to.
variable "env" {
    type        = string
    description = "Used in naming conventions and tagging to identify the environment type"

# 7.
# Here I've created a validation block inside of my variable. 
# This block basically says the variable has to meet my condition criteria or else it will display an error message.
# This is very similar to what we did above except we're using a built-in function called contains.
# If our variable contains any of the values in the list, it will return true.
validation {
    condition     = contains(["prod", "non-prod", "dev", "test", "sandbox", "stage"], var.env)
    error_message = "Not a valid environment type." 
    }
}

# 8.
# Another simple string variable for our instanec type/
variable "instance_type" {
    type = string
}

# 9. 
# Here I create a variable for the org which is just an example of another variable we could use for naming conventions.
variable "org_name" {
    type        = string
    description = "The name of the organization used for naming convention and tagging. Must be less than 6 characters"

# 10.
# I've created another example of a validation condition that looks for length of a variable.
# This will return a message if the variable is more than 10 characters long.
validation {
    condition     = length(var.org_name) <= 10
    error_message = "Not a valid org." 
    }
}

# 11.
# This variable is a map of string values. This means it has a key and a value pair to which the value is a string.
# In the terraform.tfvars you will see the values I've entered for this demonstration. 
variable "availability_zones" {
    type        = map(string)
    description = "A map of availability zones used for naming convention and logic." 
}

variable "region_codes" {
    type        = map(string)
    description = "A map of azs for a specific region" 
}

# 12.
# Another great example of something to variabilize. The CIDR block is often something that can be referenced from other resources or functions.
# This represents a way to make our code more dynamic. 
variable "cidr_block" {
    type        = string
    description = "This variable represents our VPC CIDR block that will apply to the VPC resource itself and can be referenced elsewhere."
}

# 13. This is a number variable I use to create unique subnets in the vpc.tf. When the looping mechanism in vpc.tf starts in adds a +1 every time it runs.
variable "borrowed_bits" {
    type = number
}