resource "aws_ecs_cluster" "ecs_cluster" {
        name = var.ecs_cluster_name
        tags = var.default_tag
        configuration {
                execute_command_configuration {
                        logging = "OVERRIDE"
                  log_configuration {
                    cloud_watch_log_group_name = var.cloud_watch_log_group_name
                  }
                }
          
        }
}

resource "aws_ecs_service" "ecs_service" {
        tags = var.default_tag
        name = var.ecs_service_name
        cluster = aws_ecs_cluster.ecs_cluster.id
        desired_count = var.ecs_service_desired_count
        task_definition = aws_ecs_task_definition.ecs_taskdefinition.arn
        launch_type = "FARGATE"
        force_new_deployment = true
        network_configuration {
                subnets         = var.subnets
                security_groups = var.alb_security_group_id
                assign_public_ip = true
                }
        load_balancer {
        target_group_arn = var.target_group_arn
        container_name = var.container_name
        container_port = var.containerPort
        }
}

resource "aws_ecs_task_definition" "ecs_taskdefinition" {
        tags = var.default_tag
        family = "service"
        requires_compatibilities = ["FARGATE"]
        network_mode = "awsvpc"
        cpu = var.task_cpu
        memory = var.task_memory
        execution_role_arn = var.ecs_execution_role_arn
        container_definitions = jsonencode([
                {
                        name = var.container_name
                        image = var.docker_image
                        cpu = var.container_cpu
                        memory = var.container_memory
                        essential = true
                        portMappings = [
                                {
                                        containerPort = var.containerPort
                                        hostPort = var.hostPort
                                        "protocol": "tcp"
                                }
                        ]   
                        log_configuration = {
  logDriver = "awslogs"
  options = {
    awslogs-group         = var.cloud_watch_log_group_name
    awslogs-region        = var.region
    awslogs-stream-prefix = "ecs"
  }
}
                         
                        }
        ])
}
