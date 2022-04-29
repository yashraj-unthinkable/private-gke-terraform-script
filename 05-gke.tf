# create gke cluster with managed node_pools, regional cluster
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  name                     = var.cluster-name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc_network.name
  subnetwork               = google_compute_subnetwork.sub-network.name
  release_channel {
    channel = "UNSPECIFIED"
  }
  private_cluster_config {
    enable_private_nodes    = var.enable-private-nodes
    master_ipv4_cidr_block  = var.master-ipv4-cidr-block
    enable_private_endpoint = var.enable-private-endpoint
  }
  #   doubt
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.96.0.0/14"
    services_ipv4_cidr_block = "10.100.0.0/20"
  }
}

# create node_pool
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "pool1" {
  name       = var.node-pool-name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.no-of-nodes

  node_config {
    preemptible  = false
    machine_type = var.preemptible-machine-type
  }

  management {
    auto_upgrade = var.auto-upgrade-node
    auto_repair  = var.auto-repair-node
  }
}
