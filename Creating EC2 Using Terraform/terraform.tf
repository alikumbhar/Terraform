terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


#with this command you can sync your terraform.tfstate file and upload it to your s3 buck which you have created
#for s3_bucket_table
# you have to provide only table name key
backend "s3" {
  bucket = "first-buck-by-kumbhar"  # bucket name where you want to store table
  key = "terraform.tfstate" #file  which you want to upload with name terraform.tfstate
  region = "us-east-2" #select the region where you bucket was created
  dynamodb_table = "dynamodb-by-kumbhar" # table name of bucket
}

}

