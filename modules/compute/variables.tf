variable "instance_name" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}
