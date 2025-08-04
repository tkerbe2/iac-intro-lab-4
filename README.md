![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🧪 Lab 4 - Testing Variables and Functions with Terraform Console

In this lab there are two code bases. In this main repo there is code that is mostly static and will create resources with very basic configuration. You will analyze this code and slightly modify it, then use Terraform Cloud to run a plan and apply to see what the results look like. Once this part is complete you will analyze the code in the dynamic branch of this repo. This code deploys the same resources and the same amount of resources but dynamically with variables, functions, validation, and logic loops. You can use both of these code bases as examples and I hihgly recommend you test them both. If you do not have access to the videos and are not a udemy student deploy both of these and look at how they differ. Challenge yourself to try and understand the variables, the looping, and validation.   


### Resources Created:
This demo does not require you to create resources - it is optional.

<br>

# 💡 Terms and Concepts

This lab is quite exentsive and has two parts. Part 1 is analysis and deployment of static code. Part 2 is analysis and deployment of dynamic code. The purpose of this two part lab is to introduce you to variables, functions, logic loops (meta-arguments), and other more advanced topics by showing you why they make our code better and more reusable. Reusable code makes our jobs as engineers easier because instead of re-inventing the wheel every single deployment, we can just take something that already exists and modularize it, modify a few variables, and deploy it. The biggest takeaway from this lab should be the understanding of why we want our code to be more dynamic and rely less on statically typed attributes or characteristics of our resources 


## Terraform Console

Terraform Console is essentially a Terraform command that opens an interactive command-line console you can interact with. This interactive console allows you to explore expressions and logic without actually creating resources. It can be incredibly useful for troubleshooting and validating your code before trying to deploy it. 

<br>

# 📖 Suggested Reading

These official HashiCorp documents will explain to you how and why . In the udemy course I also have a video that will briefly cover how to use Terraform Console to validate some of our string-interpolation and variables. If you do not have access to the udemy course please use the resource links below to explore this topic. 

<br>

- [Overview - Variables and Outputs](https://developer.hashicorp.com/terraform/language/values)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals)
- [Overview - Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Overview - Expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [for Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
- [The count Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [Strings - Interpolation](https://developer.hashicorp.com/terraform/language/expressions/strings)
- [terraform console command](https://developer.hashicorp.com/terraform/cli/commands/console)

<br>

# Lab Steps

### 1. Fork my repo with your own personal GitHub

- I recommend using your own computer with Git and Terraform installed to follow along. Additionally I would open this code with Visual Studio Code.
- Fork this repo so you can have your own version if it to use.

<img width="1239" height="62" alt="image" src="https://github.com/user-attachments/assets/18d9c691-ce13-47b9-ad5a-f8ee7747b2bc" />

[IaC Intro Lab 4](https://github.com/tkerbe2/iac-intro-lab-4)

<br>

***

<br>

### 2. Analyze the code

- Look at the code and try and figure out what it's creating and look at each resource block.

<br>

<img width="447" height="550" alt="image" src="https://github.com/user-attachments/assets/a00a8479-8efc-44ab-af47-22b6b09ade16" />

<br>

- Notice the naming on the tags and how similar it is between resources. This is something we can make more dynamic and reusable with variables.
- Look at other code and see if you can find other patterns like this that could be variabilized. 

```  
tags = {
    Name        = "tkdev-use1-dev-vpc"
    Environment = "dev"
  }
}
```

<br>

***

<br>

### 3. Change the tags

- Find all the tags in all of the .tf files and change them to something different. In my example below you can see I've changed them to something different.
- Don't forget you should change these everywhere they exist to be consistent. You will want to change them wherever they exist; security.tf, compute.tf, and vpc.tf.
- It will be easiest to run a find and replace in Visual Studio Code.

<br>

```
tags = {
    Name        = "abc-use1-prod-vpc"
    Environment = "prod"
  }
}
```

<br>

***

<br>

### 4. Change the region

- Next open the providers.tf and change the region to something other than us-east-1.

<br>

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
```

<br>

- Now that you've changed the region you have to change your tags again for the naming convention to match right?

<br>

```
tags = {
    Name        = "abc-use2-prod-vpc"
    Environment = "prod"
  }
}
```
<br>

- I have now changes my region abbreviation from use1 (us-east-1) to use2 (us-east-2) to match.

<br>

***

<br>

### 5. Create a new HCP Terraform workspace

- I recommend using Terraform Cloud and creating a new workspace.

<br>

<img width="1487" height="176" alt="image" src="https://github.com/user-attachments/assets/c6161b3f-6595-4af8-aa07-7a66b886bbdd" />

<br>

- Using VCS attach it to your GitHub repo that you should have forked from mine.

<br>

<img width="1454" height="696" alt="image" src="https://github.com/user-attachments/assets/4ae0a6d1-6ce5-49f3-af80-8c6056cb8a9f" />

<br>

- Add your environment variables.
***If you forgot how to do this check out*** [IaC Intro Lab 2](https://github.com/tkerbe2/iac-intro-lab-2)

<br>

<img width="1807" height="498" alt="image" src="https://github.com/user-attachments/assets/81e9c203-be98-4457-8c4f-f5f618c25482" />

<br>

***

<br>

### 6. Run a plan and apply

<br>

<img width="1474" height="641" alt="image" src="https://github.com/user-attachments/assets/e76976bb-8641-4b50-86a3-abaf15c0d4c2" />

<br>

- With a successful plan you should see something similiar to my screenshot with 15 new resources to create. You can simply discard this run.

<br>

<img width="1126" height="911" alt="image" src="https://github.com/user-attachments/assets/307e7a88-3b18-42a2-9227-0040eca3796a" />

<br>

***

<br>

#🛑

# ✨ Congratulations!

***

You've finished the static code portion of this lab and have completed the following items:
- ✅ Forked the repo.
- ✅ Analyzed the static code.
- ✅ Changed some values.
- ✅ Deployed the code with Terraform Cloud.

***


