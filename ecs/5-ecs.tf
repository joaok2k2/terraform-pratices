
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

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

