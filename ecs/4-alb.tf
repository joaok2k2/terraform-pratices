# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   #security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = [for subnet in local.sub_pub : subnet.id]

#   tags = merge(local.commom_tags, {
#     Environment = "Terraform-ALB"
#   })
# }
