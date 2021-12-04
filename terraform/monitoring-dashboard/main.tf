resource "google_monitoring_dashboard" "dashboard" {
  project      = var.gcp_project
  dashboard_json = <<EOF
 
{
  "displayName": "Grid Layout Example",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Widget 1",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\"",
                "aggregation": {
                  "alignmentPeriod": "60s",
                  "crossSeriesReducer": "REDUCE_NONE",
                  "perSeriesAligner": "ALIGN_MEAN" 
                } 
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}

EOF
}
