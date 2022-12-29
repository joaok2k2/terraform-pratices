locals {
  ip_filepath = "ips.json"
  commom_tags = {

    service     = "Terrafom pratices"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "João Silva"

  }
}