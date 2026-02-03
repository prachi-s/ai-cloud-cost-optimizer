resource "google_service_account" "metrics_sa" {
  account_id   = "metrics-sa"
  display_name = "Metrics Ingestion Service Account"
}

resource "google_project_iam_member" "metrics_sa_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.metrics_sa.email}"
}

resource "google_project_iam_member" "metrics_sa_bigquery" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.metrics_sa.email}"
}
