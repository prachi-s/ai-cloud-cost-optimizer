resource "google_bigquery_dataset" "k8s_metrics" {
  dataset_id = "k8s_metrics"
  location   = "US"

  labels = {
    env     = "dev"
    project = "metrics-platform"
  }
}
