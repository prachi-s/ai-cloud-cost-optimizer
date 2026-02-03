# WEEK 1 PLAN
## Day 1 – GCP & Project Setup
Outcome: Clean base project
Steps

Create GCP project
Enable APIs:
Kubernetes Engine
BigQuery
Cloud Monitoring
Artifact Registry
Create service account:
metrics-sa
Roles:
Monitoring Viewer
BigQuery Data Editor
Setup local tools:
gcloud
kubectl
terraform
✅ Checkpoint: gcloud auth list works


## Day 2 – Terraform Infrastructure
Outcome: GKE + BigQuery via IaC
Terraform resources

VPC + subnet (simple)
GKE cluster (1–2 nodes)
BigQuery dataset:
k8s_metrics
Folder structure
infra/
 ├── main.tf
 ├── gke.tf
 ├── bigquery.tf
 ├── variables.tf
Key choices
Node type: e2-standard-2
Autopilot ❌ (too abstract)
Regional cluster ❌ (single zone ok)
✅ Checkpoint: kubectl get nodes



## Day 3 – Metrics Collector Service
Outcome: Code that pulls real metrics
Service

Language: Python
Use:
Cloud Monitoring API
Kubernetes API
Metrics to collect
Pod CPU usage
Pod memory usage
Node CPU utilization
Node memory utilization
Data format
{
  "timestamp": "...",
  "cluster": "gke-demo",
  "namespace": "default",
  "pod": "app-1",
  "cpu_usage": 0.42,
  "memory_mb": 312
}
✅ Checkpoint: Metrics printed locally


## Day 4 – BigQuery Integration
Outcome: Metrics stored properly
BigQuery table

timestamp TIMESTAMP
cluster STRING
namespace STRING
pod STRING
cpu_usage FLOAT
memory_mb FLOAT
Steps
Create table
Insert rows via BigQuery client
Handle duplicates (timestamp + pod)
Validation query
SELECT COUNT(*) FROM k8s_metrics.pod_metrics;
✅ Checkpoint: Rows increasing over time


## Day 5 – Containerize & Deploy
Outcome: Running inside GKE
Steps

Dockerize metrics collector
Push to Artifact Registry
Deploy as:
Kubernetes Deployment OR
CronJob (recommended: every 5 min)
Attach service account
YAML basics
Requests/limits set
Env vars for project ID
✅ Checkpoint: Pod running + data flowing


## Day 6 – Synthetic Workload Generator
Outcome: Realistic usage patterns
Why: Free tier + ML training

Implementation

Kubernetes CronJob
Generates:
CPU spikes
Memory bursts
Runs dummy pods
Bonus
Label workloads (load=synthetic)
✅ Checkpoint: Metrics show spikes


## Day 7 – Observability & Cleanup
Outcome: Confidence + clarity
Tasks

Basic Grafana dashboard:
CPU usage over time
Pod count
Verify:
No crashes
Costs under control
Document:
Architecture diagram (draw.io)
Week 1 README
✅ FINAL WEEK 1 DELIVERABLE
GKE running
Metrics in BigQuery
Synthetic + real data
Infra via Terraform
