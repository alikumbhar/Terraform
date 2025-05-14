# Key Pair Resources
resource aws_key_pair my_key_new{
    key_name = "${var.env}-bluetooth-app-key"
    public_key = file("terra-key-ec2.pub")
    tags = {
      Environment = var.env
    }
}

#VPC Resources
resource aws_default_vpc default{

}
#Security Groups Resources
resource aws_security_group my_security_group{
    name = "${var.env}-bluetooth-app-security"
    description = "this will added in bluetooth security groups"
    vpc_id = aws_default_vpc.default.id # interpolation is a way in which you can inherit or extract values from a terraform block 
    
    
    #security groups portion
    #inbound rules
    ingress {
        from_port = 22
        to_port = 22 
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }
    ingress {
        from_port = 80 #var.from_port_in_80
        to_port = 80 #var.to_port_in_80 
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }    

    # ingress {
    #     from_port = 8000
    #     to_port = 8000
    #     protocol = "TCP"
    #     cidr_blocks = ["0.0.0.0/0"]
    #     description = "flask app"
    # }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access"
    }
    #outbound rules



    tags = {
        Name = "${var.env}-bluetooth-app"
        Environment = var.env
    }
}
#ec2  instance
resource "aws_instance" "my_instance" {
    count = var.instance_count #this count is used for create more than one instance
    # for_each = tomap({
    #     bluetooth_app  = "t2.micro",
    # })
    
    depends_on = [ aws_security_group.my_security_group , aws_key_pair.my_key_new ]

    key_name = aws_key_pair.my_key_new.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = var.instance_type  #each.value #var.ec2_instance_type
    ami = var.ec2_ami_id #ubuntu 22 ami-id
    user_data = file("install_nginx.sh") 
    #reading custom script from install nginx file

    root_block_device {
        #volume_size = var.aws_root_storage_size
        volume_size = var.env == "prd" ? 12 : 10
        volume_type = "gp3" 
    }

    tags = {
        Name = "${var.env}-bluetooth-app-ec2"  #each.key #"jenkins-master_from_local_machine"
        Environment = var.env
    }
}

