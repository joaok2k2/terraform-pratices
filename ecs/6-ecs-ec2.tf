
resource "aws_kms_key" "this" {
  description             = "log container keys"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "this" {
  name = var.name_group_logs
}


resource "aws_ecs_cluster" "this" {
  name = var.cluster-ecs-name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.this.arn
      logging = "OVERRIDE"

      log_configuration{
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name = aws_cloudwatch_log_group.this.name
      }
    }
  }

}


resource "aws_launch_template" "this"{
  name_prefix = "terraform"
  image_id = "ami-07f3ef11ec14a1ea3"
  instance_type = "t3.medium"
}


resource "aws_autoscaling_group" "this"{
  availability_zones = ["us-west-2a"]
  desired_capacity = 1
  max_size = 5
  min_size = 1
  launch_template{
    id = aws_launch_template.this.id
    version = "$Latest"
  }

}

resource "aws_ecs_capacity_provider" "this" {
  name = "terraform"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.this.arn
  }
}


resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = [aws_ecs_capacity_provider.this.name]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = aws_ecs_capacity_provider.this.name
  }
}

