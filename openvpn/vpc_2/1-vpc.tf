resource "aws_vpc" "this" {
  cidr_block = var.cidr_vpc

  tags = merge(local.commom_tags, {
    Name = "VPC-OPENVPN-2" # Nome da VPC 
  })
}



