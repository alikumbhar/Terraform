#keypair login required_providers

resource aws_key_pair my_key_new{
    key_name = "terra-key-ec2-new-${var.env}"
    public_key = file("terra-key-ec2.pub")
    tags = {
      Environment = var.env
    }
}

#vpc & securtiy groups needed to

resource aws_default_vpc default{

}

resource aws_security_group my_security_group{
    name = "automate-sg-${var.env}"
    description = "this will added in TF generated security groups"
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
        from_port = var.from_port_in_80
        to_port = var.to_port_in_80 
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
        Name = "automate-sg-${var.env}"
        Environment = var.env
    }
}

#ec2  instance
resource "aws_instance" "my_instance" {
    #count = 2 #this count is used for create more than one instance
    for_each = tomap({
        muhammad_usman  = "t2.micro",
    })
    
    depends_on = [ aws_security_group.my_security_group , aws_key_pair.my_key_new ]

    key_name = aws_key_pair.my_key_new.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type =  each.value #var.ec2_instance_type
    ami = var.ec2_ami_id #ubuntu 22 ami-id
    user_data = file("install_nginx.sh") 
    #reading custom script from install nginx file

    root_block_device {
        #volume_size = var.aws_root_storage_size
        volume_size = var.env == "prd" ? 12 : var.aws_root_storage_size
        volume_type = "gp3" 
    }

    tags = {
        Name = each.key #"jenkins-master_from_local_machine"
        Environment = var.env
    }
}




#agr ap ko neechy wala unknown instance banana hai to ap ko sab s pahely
#terraform import aws_instance.my_new_instance i-05f7885529adcac4c ye comamnd chalani parhegi ap already bany ho instance ki
# id laga dena jis ki madad s ap instance ki sary features ki copy krlenge jese vps,keypairs,security groups evrything
# resource "aws_instance" "my_new_instance" {
#     ami = "unknown"
#     instance_type = "unknown"
# }


