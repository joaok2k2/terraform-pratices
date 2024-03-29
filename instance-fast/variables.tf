variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ami" {
  type = string
  default = "ami-0df24e148fdb9f1d8"  
}

variable "instance_type"{
  type = string
  default = "t2.small"
}

// CIDR VPC
variable "cidr_vpc" {

  type    = string
  default = "10.40.0.0/16"
}


// Public subnet
variable "sub-pub-1a" {
  type    = string
  default = "10.40.0.0/19"
}

variable "sub-pub-1b" {
  type    = string
  default = "10.40.32.0/19"
}

variable "sub-pub-1c" {
  type    = string
  default = "10.40.64.0/19"
}

// Private subnet
variable "sub-priv-1a" {
  type    = string
  default = "10.40.96.0/19"
}
variable "sub-priv-1b" {
  type    = string
  default = "10.40.128.0/19"
}
variable "sub-priv-1c" {
  type    = string
  default = "10.40.160.0/19"
}
