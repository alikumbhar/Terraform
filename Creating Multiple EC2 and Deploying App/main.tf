module "dev-prd" {
    source = "./bluetooth-app"
    env = "dev"
    bucket_name = "bluetooth-app-bucket"
    instance_count = 1
    instance_type = "t2.nano"
    ec2_ami_id = "ami-0c3b809fcf2445b6a" # LINUX AMI ID
    hash_key = "studentID"
}

module "prd-bluetooth" {
    source = "./bluetooth-app"
    env = "prd"
    bucket_name = "bluetooth-app-bucket"
    instance_count = 2
    instance_type = "t2.small"
    ec2_ami_id = "ami-0c3b809fcf2445b6a" # LINUX AMI ID
    hash_key = "studentID"
}

module "stg-bluetooth" {
    source = "./bluetooth-app"
    env = "stg"
    bucket_name = "bluetooth-app-bucket"
    instance_count = 2
    instance_type = "t2.small"
    ec2_ami_id = "ami-0c3b809fcf2445b6a" # LINUX AMI ID
    hash_key = "studentID"
}