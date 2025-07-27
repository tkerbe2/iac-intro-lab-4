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

# Lab Steps

### 1. Log into Azure and open Cloud Shell

![cloudshell](https://github.com/user-attachments/assets/a24f345c-e380-4f54-8a4b-f6b8463c023e)

- In the top right corner of the UI there is a terminal looking icon.

<br>


***

<br>

### 2. Launch a Bash Cloud Shell
- You will be asked if you want to launch a bash or power shell cloud shell. Choose bash for this example.
![image](https://github.com/user-attachments/assets/e03421ca-8057-4539-bfe8-c638d9473b3b)

***

<br>

### 3. Find your Azure Subscription ID
```az account show --query id --output tsv```
<br>
- This is showing you your Azure subscription ID, this is highly sensitive.
<br>

> **_Note:_** In a real world scenario we would want to pass this variable in a more secure way.

***

<br>





# ✨ Congratulations!

***

You've finished this lab and have completed the following items:
- ✅ Created a new AWS account.
- ✅ Logged into your AWS root account.
- ✅ Created an AWS IAM user that will be used for Terraform.
- ✅ Created an access key and secret key with the new user.

***

