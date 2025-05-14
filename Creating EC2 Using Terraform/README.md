
#Creating EC2 Instance Using Terraform

###for running this instance you need to change 
value in variables


after changing variable value execute these commands
##Configure the AWS CLI
first you need to make sure that you have AWS CLI installed or not


##after installing AWS CLI
1. aws configure

You’ll be prompted to enter:
	1.	AWS Access Key ID
	2.	AWS Secret Access Key
	3.	Default region name (e.g., us-east-1, us-west-2)
	4.	Default output format (e.g., json, table, text)

Step 3: Verify the Configuration

Run:
```bash
 aws configure list
``
Test the Configuration

Try running a simple AWS CLI command, like listing S3 buckets:

```bash
 aws s3 ls
``

if this return 


then >>

Back to terraform and run some commands


1. terraform init to initialize and load aws detail
```bash
 terraform init
``
Purpose: Prepares your working directory for use with Terraform.

Details:
	•	Downloads the provider plugins specified in your configuration.
	•	Sets up the backend if you’re using remote state.
	•	Initializes the .terraform directory.



 2. Create an Execution Plan
```bash
 terraform plan
``
  Purpose:

Shows what Terraform intends to do based on your configuration — it’s a dry run.

What it does:
	•	Compares the current state with the desired configuration in .tf files.
	•	Shows what will be created, changed, or destroyed.
	•	Doesn’t actually make any changes.


3. terraform apply
```bash
 terraform apply
``
Purpose:

Executes the changes required to reach the desired state of the configuration.

What it does:
	•	Applies the changes outlined by terraform plan.
	•	Updates real infrastructure (e.g., creates VMs, sets up networks).
	•	Modifies the state file to reflect the new real-world infrastructure.



```bash
 terraform apply -auto-approve
``


 
