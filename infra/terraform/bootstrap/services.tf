resource "google_project_service" "required_apis" {
  for_each = toset([
    "container.googleapis.com",
    "bigquery.googleapis.com",
    "monitoring.googleapis.com",
    "artifactregistry.googleapis.com"
  ])

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}
