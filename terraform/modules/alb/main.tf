resource "aws_lb" "ecs_alb" {
        name = var.alb_name
        internal = false
        load_balancer_type = "application"
        security_groups = [var.security_group_id_alb]
        subnets = var.public_subnet_ids  
        tags = var.default_tag

}

resource "aws_lb_target_group" "ecs_alb_tg" {
        name = var.alb_tg_name
        port = 80
        protocol = "HTTP"
        vpc_id = var.vpc_id
        target_type = "ip"
        tags = var.default_tag
}

resource "aws_lb_listener" "ecs_alb_listener" {
        tags = var.default_tag
        load_balancer_arn = aws_lb.ecs_alb.arn
        port = 80
        protocol = "HTTP"
        default_action {
          type = "forward"
          target_group_arn = aws_lb_target_group.ecs_alb_tg.arn
        }
}