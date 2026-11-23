output "vpc_name" {
  value = module.vpc.network_name
}

output "subnet_name" {
  value = module.vpc.subnet_name
}

output "gcs_bucket" {
  value = module.gcs.bucket_name
}

output "compute_instance" {
  value = module.compute.instance_name
}

output "gke_cluster" {
  value = var.enable_gke ? module.gke[0].cluster_name : "GKE disabled"
}
