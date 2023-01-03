data "template_file" "json"{


    template = file("template.json.tpl")

    vars = {

        age = 21
        eye = "Brown-green"
        name = "João"
        gender = "Male"

    }

}


data ""



