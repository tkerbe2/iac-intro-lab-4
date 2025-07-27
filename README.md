![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🧪 Testing Variables and Functions with Terraform Console - Guided Lab

In this lab you will be introduced to Terraform Console where we can test our variables, functions, data structures, and other logic with the CLI. In this lab you will not deploy any resources to AWS or Azure.  


### Resources Created:
This demo does not create resources.

<br>

# 💡 Terms and Concepts

Before we get started I want to discuss some key terms and concepts about AWS and accounts. This is not meant to be an AWS course or AWS specific guide but I realize many who take this will be new to AWS so I want to cover it. If this information is not new to you, feel free to skip this and the suggested reading.

### AWS Accounts

In AWS your account is like a container that all your resources you build such as VMs, buckets, etc, get attached to. Inside your account you can have users and roles with defined permissions, etc. All of this still lives within your account and your account will have a unique account ID that is tied to the email you used when you created it. Initially you will log into the AWS console with your root account (the account you created when you signed up) this will be your email. Root has unrestricted access to the entire AWS account and you rarely want to use this for day-to-day acitivity and creating infrastructure. This lab will walk through how to more tightely secure your root account with MFA and then create other accounts that you can use for this lab.

<br>



> 📖 Suggested Reading 
- [What is an AWS account?](https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html)
- [Terminology and concepts for AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html)

<br>

# Lab Steps

### 1. Log into AWS

- Log into AWS with your root account [AWS](https://aws.amazon.com/)

![image](https://github.com/user-attachments/assets/464af956-2c61-487d-bbef-acce4a9378f0)

<br>

***

### 2. Open Identity and Access Management (IAM)

![image](https://github.com/user-attachments/assets/27f8a292-70a5-4475-9628-fd0c0ddda89c)

- You can favorite it so it's easier to find later

<br>

***

### 3. Create and assign access to the user






# ✨ Congratulations!

***

You've finished this lab and have completed the following items:
- ✅ Created a new AWS account.
- ✅ Logged into your AWS root account.
- ✅ Created an AWS IAM user that will be used for Terraform.
- ✅ Created an access key and secret key with the new user.

***

