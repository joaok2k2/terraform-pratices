output "files" {
  value = local.file_extensions
}

#Formato de lista (list)
output "instance_arns" {
  value = [for k, v in aws_instance.this : v.arn]

}

#Formato de objeto (map)
output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.Name }
}

output "extensions_upper" {
  value = local.file_filter

}

output "ips_pub" {
  value = [for pb in local.ips : pb.public]
}

#splat operator
output "ips_priv" {
  value = local.ips[*].private
}