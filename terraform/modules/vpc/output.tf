output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.vpc_gsr.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.subnet_public[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.subnet_private[*].id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw_public.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.route_table_public.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.route_table_private.id
}