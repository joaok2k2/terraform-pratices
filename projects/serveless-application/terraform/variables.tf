variable "region" {
  type    = string
  default = "us-west-2"
}


variable "service_name" {
  type    = string
  default = "Todos"
}


variable "service_domain" {
  type    = string
  default = "api-todos"
}

variable "aws_account_id" {
  type        = number
  description = ""
  default     = 431591413306
}

