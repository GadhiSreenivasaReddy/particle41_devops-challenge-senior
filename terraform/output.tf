# iam
output "aws_iam_policy" {
    value = module.iam.aws_iam_policy
}

output "aws_iam_role" {
    value = module.iam.aws_iam_role
}
#cloudwatch
output "aws_cloudwatch_log_group_arn" {
        value = module.cloudwatch.aws_cloudwatch_log_group_arn
}
output "aws_cloudwatch_log_group_name" {
  value = module.cloudwatch.cloudwatch_log_group_name  
}
#vpc
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids[*]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids[*]
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.vpc.private_route_table_id
}

#ecs
output "ecs_cluster_name" {
        value = module.ecs.ecs_cluster_name
}
output "ecs_service_id" {
        value = module.ecs.ecs_service_id
        }
#alb
output "alb_dns" {
  value = module.alb.alb_dns  
}