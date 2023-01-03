variable "region" {
  type        = string
  description = ""
  default     = "us-west-2"
}


variable "env" {}


variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0ceecbb0f30a902a6"


  validation {

    condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"

    error_message = "The instance_ami value must be a valid AMI id, starting with \"ami-\"."

  }
}

variable "instance_number" {

  type = object({

    dev  = number
    prod = number
  })

  description = "Number of instances to create"

  default = {
    dev  = 1
    prod = 3
  }
}

variable "instance_type" {

  type = object({
    dev  = string
    prod = string
  })

  description = "Type of instance family"

  default = {

    dev  = "t3.micro"
    prod = "t3.medium"
  }
}


