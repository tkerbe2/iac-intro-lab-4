![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🧪 Lab 4 - Testing Variables and Functions with Terraform Console

In this lab you will be introduced to Terraform Console where we can test our variables, functions, data structures, and other logic with the CLI. In this lab you will not deploy any resources to AWS or Azure unless you want to.   


### Resources Created:
This demo does not require you to create resources - it is optional.

<br>

# 💡 Terms and Concepts

In this guided exercise you will explore data types and how to use and manipulate them with variables, expressions, and functions. Building on these concepts you will then create some more dynamic code and validate it with Terraform Console. I recommend reading the links below from HashiCorps official documentation before starting the guided exercise. These readings are short and will give you some good fundamental knowledge of what we will cover in this guided exercise.

## Terraform Console

Terraform Console is essentially a Terraform command that opens an interactive command-line console you can interact with. This interactive console allows you to explore expressions and logic without actually creating resources. It can be incredibly useful for troubleshooting and validating your code before trying to deploy it. 

<br>

> 📖 Suggested Reading
- [Overview - Variables and Outputs](https://developer.hashicorp.com/terraform/language/values)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals)
- [Overview - Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Overview - Expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [for Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
- [Strings - Interpolation](https://developer.hashicorp.com/terraform/language/expressions/strings)

<br>

# Lab Steps

### 1. Pull the static code from the main repo

- I recommend using your own computer with Git and Terraform installed to follow along. Additionally I would open this code with Visual Studio Code.

```git clone https://github.com/tkerbe2/iac-intro-lab-4/```

<br>

***

<br>

### 2. Analyze the code

- Look at the code and try and figure out what it's creating and look at each resource block.

<img width="447" height="550" alt="image" src="https://github.com/user-attachments/assets/a00a8479-8efc-44ab-af47-22b6b09ade16" />

- Notice the naming on the tags and how similar it is between resources. This is something we can make more dynamic and reusable with variables.
- Look at other code and see if you can find other patterns like this that could be variabilized. 

```  
tags = {
    Name        = "tkdev-use1-dev-vpc"
    Environment = "dev"
  }
}
```

***

<br>

### 3. Clone the Repo
```git clone https://github.com/tkerbe2/iac-intro-lab-4/```

<img width="876" height="302" alt="image" src="https://github.com/user-attachments/assets/f4c0b851-cda6-49a7-b0d6-c06ecf57a9aa" />

***

<br>

### 4. Verify Terraform and initialize the directory
```terraform version```

<br>

```cd iac-intro-lab-4/```

<br>

```terraform init```

<br>

<img width="876" height="302" alt="image" src="https://github.com/user-attachments/assets/f4c0b851-cda6-49a7-b0d6-c06ecf57a9aa" />

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

