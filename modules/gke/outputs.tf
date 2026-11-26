output "cluster_name" {
  value = google_container_cluster.cluster.name
}

output "endpoint" {
  value     = google_container_cluster.cluster.endpoint
  sensitive = true
}

output "application_node_pool" {
  value = google_container_node_pool.application.name
}

output "batch_node_pool" {
  value = google_container_node_pool.batch.name
}
