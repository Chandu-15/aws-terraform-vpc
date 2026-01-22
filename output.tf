output "vpc_id"{
    value=aws_vpc.main.id
}

output "public_subnet_cidr"{
    value=aws_subnet.public[*].id
}