variable "ec2_instance_type" {
    default = "t2.micro"
    type = string
}


variable "aws_root_storage_size" {
    default = 10
    type = number
}


variable "ec2_ami_id" {
    default = "ami-0c3b809fcf2445b6a"  #here you have to put updated ami id
    type = string
}

variable "from_port_in_80" {
    default = 80
    type = number
}

variable "to_port_in_80" {
    default = 80
    type = number
}
  
variable "env" {
  default = "dev"
  type = string
}