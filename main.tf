module "vpc" {
  source = "./modules/vpc"

  name_prefix = local.name_prefix
  region      = var.region
  subnet_cidr = "10.10.0.0/24"
}

module "gcs" {
  source = "./modules/gcs"

  bucket_name = "${var.project_id}-lbg-${var.environment}-storage"
  location    = "US"
  labels      = local.common_labels
}

module "compute" {
  source = "./modules/compute"

  instance_name = "${local.name_prefix}-vm"
  zone          = var.zone
  machine_type  = "e2-micro"
  network       = module.vpc.network_self_link
  subnetwork    = module.vpc.subnet_self_link
  labels        = local.common_labels
}

module "gke" {
  count  = var.enable_gke ? 1 : 0
  source = "./modules/gke"

  cluster_name = "${local.name_prefix}-gke"
  location     = var.region
  network      = module.vpc.network_self_link
  subnetwork   = module.vpc.subnet_self_link
}
