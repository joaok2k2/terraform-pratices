locals {

  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }
  common_tags = {
    Project   = "Curso AWS com terraform"
    CreatedAt = "23/02/2023"
    ManagedBy = "Terraform"
    Owner     = "João Silva"
    Service   = "Auto Scaling Application"
  }
}