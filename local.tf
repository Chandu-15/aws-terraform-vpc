locals{
    common_name="${var.project_name}-${var.environment}"
    common_tags={
        Name=var.project_name
        terraform=true
        az_names=slice(data.aws_availability_zone.availability.name,0,2)
    }
}