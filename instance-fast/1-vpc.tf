resource "aws_vpc" "this" {
  cidr_block = var.cidr_vpc

  tags = merge(local.commom_tags, {
    Name = "VPC-EC2-FAST-TEST" # Nome da VPC 
  })
}



