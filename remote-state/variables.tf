variable "aws_region" {
  type        = string
  description = ""
  default     = "us-west-2"
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-0ceecbb0f30a902a6"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}