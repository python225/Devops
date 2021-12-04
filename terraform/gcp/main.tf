#resource "google_compute_network" "vpc_network" {
#  name = "var.vpc_name"
#}

resource "google_monitoring_alert_policy" "alert_policy" {
  project      = var.gcp_project
  display_name = var.alert_name
  combiner     = "OR"
  conditions {
      display_name = var.alert_name
      condition_threshold  {
        aggregations {
          
            alignment_period = "300s"
            per_series_aligner = "ALIGN_RATE"
          
        }
        comparison = "COMPARISON_GT"
        duration = "60s"
        filter = "metric.type=\"compute.googleapis.com/instance/cpu/usage_time\" resource.type=\"gce_instance\" resource.label.\"project_id\"=\"test-project-56129\""
        threshold_value = 80
        trigger {
          count = 1
        }
      }
    }
  }
