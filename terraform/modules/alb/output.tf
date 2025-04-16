output "alb_dns" {
        value = aws_lb.ecs_alb.dns_name
}
output "aws_lb_target_group_name" {
        value = aws_lb_target_group.ecs_alb_tg.name
}
output "aws_lb_target_group_arn" {
        value = aws_lb_target_group.ecs_alb_tg.arn
  
}