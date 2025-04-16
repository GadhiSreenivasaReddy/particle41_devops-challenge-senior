resource "aws_cloudwatch_log_group" "ecs_log_group" {
        tags = var.default_tags
        name = var.cloudwatchloggroupname
        retention_in_days = var.logs_retention_days
}