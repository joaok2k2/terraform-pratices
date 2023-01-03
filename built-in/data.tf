# Interpolação no arquivo json
data "template_file" "json" {


  template = file("template.json.tpl")

  vars = {

    age    = 21
    eye    = "Brown-green"
    name   = "João"
    gender = "Male"

  }

}


# Zip do arquivo, juntamente com a conversão do json
data "archive_file" "json" {
  type        = local.file_ext
  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"

  source {

    content  = data.template_file.json.rendered
    filename = "${local.object_name}.json"
  }
}



