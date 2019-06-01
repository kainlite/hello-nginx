data "google_container_engine_versions" "central1b" {
  location           = "us-central1-b"
  version_prefix = "1.12."
}

resource "google_container_cluster" "testinggcp" {
  name               = "terraform-test-cluster"
  location           = "us-central1-b"
  node_version       = "${data.google_container_engine_versions.central1b.latest_node_version}"
  min_master_version = "${data.google_container_engine_versions.central1b.latest_node_version}"
  initial_node_count = 2

  master_auth {
    username = "kainlite"
    password = "testinggooglecloudplatform"
  }
}

output "endpoint" {
  value = "${google_container_cluster.testinggcp.endpoint}"
}

output "client_certificate" {
  value = "${google_container_cluster.testinggcp.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.testinggcp.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.testinggcp.master_auth.0.cluster_ca_certificate}"
}

output "node_config" {
  value = "${google_container_cluster.testinggcp.node_config}"
}
