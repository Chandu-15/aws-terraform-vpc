resource "aws_vpc" "main" {
    cidr_block= var.vpc_cidr
    instance_tenancy= "default"
    enable_host_names= true
    tags= merge(
        local.common_tags , 
       {Name="${local.common_name}-dev-vpc"}
    )

}