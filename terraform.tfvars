#=======================#
# Define Variables Here #
#=======================#

# a .tfvars file is a file extension that Terraform uses to define input variables.  
# What we're doing here is telling Terraform how to treat these variables by specifying the following:
# Data type, validation and conditions, default values, and if the data is sensitive or not. 


variable "region" {
    type        = string
    description = "Used to specify the region to deploy our resources to and apply to naming conventions."

# Notice I've set a default here. This means that if no value is supplied elsewhere -- the default value will be applied.    
    default     = "us-east-1"

# Maybe my organization only allows the use of certain regions. We can create a simple validation condition to ensure only those regions are used. 
# Examine line 25 carefully. Ask yourself what do you think this code is doing? 

# lower() is a function that converts string text to lowercase.
# || is the operator for OR.
# == operator returns true if both objects being compared have the same value and same type.

validation {
    condition     = lower(var.region) == "us-east-1" || lower(var.region) == "us-east-2" || lower(var.region) == "us-west-1" || lower(var.region) == "us-west-2"
    error_message = "Not a supported region." 
    }
}

variable "environment" {
    type        = string
    description = "Used in naming conventions and tagging to identify the environment type"

# Here I've created a validation block inside of my variable. 
# This block basically says the variable has to meet my condition criteria or else it will display an error message.
# I've essentially created this code so that the environment has to be prod, nonprod, dev, or test. 
# The case doesn't matter because the lower() function will set my variable to lowercase when it checks.

validation {
    condition     = lower(var.environment) == "prod" || lower(var.environment) == "nonprod" || lower(var.environment) == "dev" || lower(var.environment) == "test" 
    error_message = "Not a valid environment type." 
    }
}

variable "org" {
    type        = string
    description = "The name of the organization used for naming convention and tagging. Must be less than 6 characters"

validation {
    condition     = length(var.org) <= 10
    error_message = "Not a org type." 
    }
}

# This variable is a map of string values. This means it has a key and a value pair to which the value is a string.
# In the variables.tf you will see the values I've entered for this demonstration. 
variable "region-code" {
    type        = map(string)
    description = "A map of region codes used for naming convention and tagging." 
}

# Another great example of something to variabilize. The CIDR block is often something that can be referenced from other resources or functions.
# This represents a way to make our code more dynamic. 
variable "cidr-block" {
    type        = string
    description = "This variable represents our VPC CIDR block that will apply to the VPC resource itself and can be referenced elsewhere."
}
