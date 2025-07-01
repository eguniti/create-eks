module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "assess-eks-cluster"
    cluster_version = "1.28"

    cluster_endpoint_public_access  = true

    vpc_id = module.jenkins-vpc.vpc_id
    subnet_ids = module.jenkins-vpc.private_subnets

    tags = {
        Environment = "Dev"
        Project = "Promotion Assessment"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 2
            max_size = 10
            desired_size = 2

            instance_types = ["t2.large"]
        }
    }
}
