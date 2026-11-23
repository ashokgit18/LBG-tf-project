variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "enable_gke" {
  description = "Enable GKE creation"
  type        = bool
  default     = false
}
