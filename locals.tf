locals {
  name_prefix = "lbg-${var.environment}"

  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "lbg-tf-project"
  }
}
