variable "default_tag" {
        type = map(string)
  
}
variable "alb_name" {
        type = string
}
variable "security_group_id_alb" {
        type = string
  
}
variable "public_subnet_ids" {
        type = list(string)
  
}
variable "vpc_id" {
        type = string
}
variable "alb_tg_name" {
        type = string
  
}