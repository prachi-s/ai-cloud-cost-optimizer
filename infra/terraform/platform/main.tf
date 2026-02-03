resource "google_compute_network" "main_vpc" {
  name                    = "metrics-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main_subnet" {
  name          = "metrics-subnet"
  region        = var.region
  network       = google_compute_network.main_vpc.id
  ip_cidr_range = "10.10.0.0/16"
}
