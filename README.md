![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🧪 Testing Variables and Functions with Terraform Console - Guided Lab

In this lab you will be introduced to Terraform Console where we can test our variables, functions, data structures, and other logic with the CLI. In this lab you will not deploy any resources to AWS or Azure.  


### Resources Created:
This demo does not create resources.

<br>

# 💡 Terms and Concepts

In this guided exercise you will explore data types and how to use and manipulate them with variables, expressions, and functions. Building on these concepts you will then create some more dynamic code and validate it with Terraform Console. I recommend reading the links below for some additional examples and extra context. 

<br>

> 📖 Suggested Reading
- [Overview - Variables and Outputs](https://developer.hashicorp.com/terraform/language/values)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals)
- [Overview - Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Overview - Expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [for Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)

<br>

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

