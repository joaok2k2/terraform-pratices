variable "name"{
    type = string
    description = "Bucket Name"
}

variable "acl"{
    type = string
    default = "private"
}

variable "policy" {
    type = string
    default = "null"
}

variable "tags"{
    type = map(string)
    default = {
        CreatedBy = "Terraform"
        Owner = "João"
    }
}

variable "website"{
    type = map(string)
    default = {}
}