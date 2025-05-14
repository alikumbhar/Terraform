module "eks" {
    # import the module template
    source = "terraform-aws-modules/eks/aws"
    #version = "~> 20.31"
    # this show cluster information
    cluster_name    = "${local.name}-vpc"
    #cluster_version = "1.31"
    cluster_endpoint_public_access = true
    
    vpc_id = module.vpc.vpc_id
    subnet_ids =  module.vpc.private_subnets
    
    cluster_addons = {
        vpc-cni = {
            most-recent = true
        }
        kube-proxy = {
            core-dns = {
                most-recent = true
            }
        }
    }

    # this  is for control plan network
    #controol plan uses intera subnets network addon provide you latest internet networks

    control_plan_subnet_ids = module.vpc.intra_subnets 


    # this is for managing nodes in the clcuster
    eks_managed_node_group_defaults = {
        instance_types = ["t2.medium"]
        attach_cluster_primary_security_groups =  true #you will be attached with cluster security group 
        #any node that can be attached 
    }
    eks_managed_node_groups = {
        test-cluster-node-group = {
        # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
        instance_types = ["t2.medium"]

        min_size     = 2
        max_size     = 3
        desired_size = 2

        capacity_type = "SPOT"
        }
    }
    tags = {
        Environment = local.env
        Terraform = true
    }

}