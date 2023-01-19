variable "aws_region"{

    type = object({
        dev = string
        prod = string
    })

    default = {
        dev = "eu-central-1"
        prod = "us-east-1"
    }
}

variable "instance"{   
    type = object({

        dev = object({
            ami = string
            type = string
            number = number
        })
        prod = object({
            ami = string
            type = string
            number = number
        })
    })

    default = {
      dev = {
        ami = "ami-0849a313b038afda0"
        number = 2
        type = "t2.micro"
      }
      prod = {
        ami = "ami-0849a313b038afda0"
        number = 3
        type = "t3.medium"
      }
    }
}