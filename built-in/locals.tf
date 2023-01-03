locals {

  instance_number = lookup(var.instance_number, var.env)


  common_tags = {

    "Owner" = "João"
    "Year"  = "2023"
  }

  file_ext    = "zip"
  object_name = "meu-arquivo-gerado-de-um-template"
}