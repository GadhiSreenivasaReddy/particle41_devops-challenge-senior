variable "region" {
        type = string  
}

variable "default_tags" {
        type = map(string)
}
#cloudwatch
variable "logs_retention_days" {
        type = number
}
variable "cloudwatchloggroupname" {
        type = string  
}
#vpc
variable "cidr_block" {
        type = string
}
#ecs
variable "ecs_cluster_name" {
        type = string 
}
variable "ecs_service_name" {
        type = string
}
variable "ecs_service_desired_count" {
        type = number  
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
variable "task_cpu" {
        type = number
}
variable "task_memory" {
        type = number  
}

#sg
variable "securitygroup_name" {
        type = string
}

#alb
variable "alb_name" {
        type = string  
}
variable "alb_tg_name" {
        type = string  
}
