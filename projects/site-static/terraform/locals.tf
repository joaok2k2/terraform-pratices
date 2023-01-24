locals {
  has_domain = var.domain != ""

  domain          = local.has_domain ? var.domain : random_pet.website.id
  regional_domain = module.website.regional_domain_name

  commom_tags = {
    Project   = "Pratices Terraform"
    Service   = "Static Website"
    CreatedAt = "2023-01-22"
    Owner     = "João"
  }
}