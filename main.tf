resource "aws_vpc" "main" {
    cidr_block= var.vpc_cidr
    instance_tenancy= "default"
    enable_dns_hostnames= true
    tags= merge(
        var.vpc_tags,
        local.common_tags , 
       {Name="${local.common_name}-vpc"}
    )

}

resource "aws_internet_gateway" "main"{
    vpc_id=aws_vpc.main.id 
    tags=merge(
        var.igw_tags,
        local.common_tags, 
        { 
            Name=local.common_name }
    )
}

resource "aws_subnet" "public"{
    count=length(var.public_subnet_cidr)
    vpc_id=aws_vpc.main.id
    cidr_block=var.public_subnet_cidr[count.index]
    availability_zone=local.az_names[count.index]
    map_public_ip_on_launch=true
    tags=merge(
        var.public_subnet_tags,
        local.common_tags, 
        { 
            Name="${local.common_name}-public-${local.az_names[count.index]}"
        }
    )
}

resource "aws_subnet" "private" {
    count=length(var.private_subnet_cidr)
    vpc_id=aws_vpc.main.id
    cidr_block=var.private_subnet_cidr[count.index]
    availability_zone=local.az_names[count.index]
    tags=merge(
        var.private_subnet_tags,
        local.common_tags, 
        { 
            Name="${local.common_name}-private-${local.az_names[count.index]}"
        }
      )  
}