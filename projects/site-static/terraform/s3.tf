data "template_file" "bucket_policy" {
  template = file("policy.json")
  vars     = { bucket_name = local.domain }
}

module "logs" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = "${local.domain}-logs"
  acl           = "log-delivery-write"
  force_destroy = !local.has_domain
  tags = local.commom_tags
}

module "website" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = local.domain
  acl           = "public-read"
  policy        = data.template_file.bucket_policy.rendered
  force_destroy = !local.has_domain
  tags = local.commom_tags

  versioning = {
    enabled = true
  }

  filepath = "${path.module}/../my-app/build"

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging = {
    target_bucket  = module.logs.name
    target_prefeix = "access/"
  }
}
module "redirect" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = "www.${local.domain}"
  acl           = "public-read"
  force_destroy = !local.has_domain
  tags = local.commom_tags
  
  website = {
    redirect_all_requests_to = local.has_domain ? var.domain : module.website.website
  }

}
