resource "aws_security_group" "ecs_sg" {
        name = var.securitygroup_name
        tags = var.default_tag
        vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "egress_allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_sg.id
}


resource "aws_security_group_rule" "ecs_ingress_tcp" {
        type = "ingress"
        protocol = "tcp"
        to_port = "80"
        from_port = "80"
        cidr_blocks = ["0.0.0.0/0"]
        security_group_id = aws_security_group.ecs_sg.id
}