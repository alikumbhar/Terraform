

variable "ec2_ami_id" {
    #default = "ami-0c3b809fcf2445b6a"  #here you have to put updated ami id
    description = "this is my instance type of ec2 bluetooth-app"
    type = string
}

  
variable "env" {
    description = "This is the environment for bluetooth app"
    type = string
}
variable "bucket_name" {
    description = "This is the bucket name for bluetooth app"
    type = string
}

variable "instance_count" {
    description = "this is no. of ec2 instance"
    type = number
}

variable "instance_type" {
    description = "this is the type of ec2 bluetooth-app"
    type = string
}

variable "hash_key" {
    description = "this is hashkey for dynamodb table-bluetooth-app"
    type = string
  
}