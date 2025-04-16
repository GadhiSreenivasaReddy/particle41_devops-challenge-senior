output "aws_cloudwatch_log_group_arn" {
        value = aws_cloudwatch_log_group.ecs_log_group.arn
}
output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.ecs_log_group.name
}