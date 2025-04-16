variable "ecs_cluster_name" {
        type = string
  
}
variable "default_tag" {
        type = map(string)
  
}
variable "ecs_service_name" {
        type = string
  
}
variable "ecs_service_desired_count" {
        type = number
}
variable "ecs_execution_role_arn" {
        type = string
  
}
variable "container_name" {
        type = string
}
variable "docker_image" {
        type = string  
}
variable "container_cpu" {
        type = number
}
variable "container_memory" {
        type = number  
}
variable "containerPort" {
        type = number
}
variable "hostPort" {
        type = number 
}
variable "cloud_watch_log_group_name" {
        type = string 
}
variable "subnets" {
        type = list(string)  
}
variable "alb_security_group_id" {
        type = list(string)  
}
variable "task_cpu" {
        type = string
}
variable "task_memory" {
        type = string  
}
variable "target_group_arn" {
        type = string
}
variable "region" {
        type = string
}