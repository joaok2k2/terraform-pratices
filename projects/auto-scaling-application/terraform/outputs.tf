output "vpc_id" {

  value = aws_vpc.this.id

}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "subnet_ids" {
  value = local.subnet_ids
}



output "route_table_id_public" {
  value = aws_route_table.public.id
}

output "route_table_id_private" {
  value = aws_route_table.private.id
}


output "route_table_association_ids" {
  value = [for k, v in aws_route_table_association.this : v.id]
}

output "sg_web_id" {
  value = aws_security_group.web.id
}

output "sg_db_id" {
  value = aws_security_group.db.id
}

output "sg_alb" {
  value = aws_security_group.aws_alb.id
}

output "alb_id" {
  value = aws_lb.this.id
}