output "ecs_cluster_name" {
        value = aws_ecs_cluster.ecs_cluster.name
}
output "ecs_service_id" {
        value = aws_ecs_service.ecs_service.id
}