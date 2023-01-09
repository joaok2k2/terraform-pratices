locals {
  commom_tags = {
    CreatedBy = "Terraform"
    Owner     = "João"
  }

  sub_pub = [aws_subnet.sub-pub-1, aws_subnet.sub-pub-2, aws_subnet.sub-pub-3]
}