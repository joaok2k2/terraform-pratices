locals {

    intance_number = lookup(var.instance_number, var.env)


    common_tags = {

        "Owner" = "João"
        "Year" = "2023"
    }
}