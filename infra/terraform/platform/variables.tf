variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
}

variable "gke_node_count" {
  type    = number
  default = 1
}

variable "gke_machine_type" {
  type    = string
  default = "e2-standard-2"
}
