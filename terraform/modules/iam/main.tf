module "iam" {
        source = "./modules/iam"
        default_tags = var.default_tags
}

module "cloudwatch" {
        source = "./modules/cloudwatch"
        default_tags = var.default_tags
        logs_retention_days = var.logs_retention_days
        cloudwatchloggroupname = var.cloudwatchloggroupname
}
module "vpc" {
        source = "./modules/vpc"
        default_tags = var.default_tags
        cidr_block = var.cidr_block  
}
module "sg" {
        source = "./modules/sg"
        default_tag = var.default_tags
        vpc_id = module.vpc.vpc_id
        securitygroup_name = var.securitygroup_name
}
module "ecs" {
        source = "./modules/ecs"
        ecs_service_name = var.ecs_service_name
        ecs_service_desired_count = var.ecs_service_desired_count
        ecs_execution_role_arn = module.iam.aws_iam_role
        container_name = var.container_name
        docker_image = var.docker_image
        container_cpu = var.container_cpu
        container_memory = var.container_memory
        containerPort = var.containerPort
        hostPort = var.hostPort
        default_tag = var.default_tags
        ecs_cluster_name = var.ecs_cluster_name
        cloud_watch_log_group_name = module.cloudwatch.cloudwatch_log_group_name
        subnets = module.vpc.public_subnet_ids[*]
        alb_security_group_id = [module.sg.aws_security_group_id]
        task_cpu = var.task_cpu
        task_memory = var.task_memory
        target_group_arn = module.alb.aws_lb_target_group_arn
        region = var.region
}
module "alb" {
        source = "./modules/alb"
        alb_name = var.alb_name
        public_subnet_ids = module.vpc.public_subnet_ids[*]
        vpc_id = module.vpc.vpc_id
        security_group_id_alb = module.sg.aws_security_group_id
        alb_tg_name = var.alb_tg_name  
        default_tag = var.default_tags
}