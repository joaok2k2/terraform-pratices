resource "aws_vpc" "this" {
  cidr_block = var.cidr_vpc

  tags = merge(local.commom_tags, {
    Name = "VPC-OPENVPN-1" # Nome da VPC 
  })
}



