region = "ap-south-1"
default_tags = {
  "user" = "gadhisreenivasareddy@gmail.com",
  "portfolio" = "https://sreenivasa.netlify.app"
}

#cloudwatch
logs_retention_days = "1"
cloudwatchloggroupname = "/ecs/gsr-ecs-cluster-log"

#vpc
cidr_block = "10.0.0.0/16"

#ecs
ecs_cluster_name = "gsr_ecs_cluster"
ecs_service_name = "gsr_ecs_service"
ecs_service_desired_count = 1
container_name = "gsr_container_name"
docker_image = "nginx"
container_cpu = 128
container_memory = 256
containerPort = 80
hostPort = 80
task_cpu = 256
task_memory = 512

#sg
securitygroup_name = "ecs_security"

#alb
alb_name = "ecs-alb-gsr"
alb_tg_name = "ecs-alb-tg-gsr"