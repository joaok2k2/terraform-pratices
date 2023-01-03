resource "aws_instance" "server"{

    count = local.intance_number <= 0 ? 0 : local.instance_number 
    ami = var.instance_ami
    
    #loouk server para vasculhar objetos e retonar o valor da chave
    instance_type = lookup(var.instance_type, var.env)


    tags = merge(local.commom_tags, {
        Project = "Terraform built-in pratices"
        Env = var.env
        Name = "Instance ${count.index + 1}"
    })


}