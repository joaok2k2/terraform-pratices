resource "aws_s3_bucket" "this" {
    bucket = var.name
    acl = var.acl
    policy = var.policy
    tags = var.tags

    dynamic "website" {
      for_each = length(keys(var.website)) == 0 ? [] : [var.website]
      content {
        index_document = lookup(website.value, "index_ document", null)
        error_document = lookup(website.value, "error_document", null)
        redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
        routing_rules = lookup(website.value, "redirect_rules", null)
      }
    }

    website{

    }
}