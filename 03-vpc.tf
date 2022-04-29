# create vpc networks
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc-name
  description             = var.vpc-description
  auto_create_subnetworks = var.auto-create-subnet
}

# subnets
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "sub-network" {
  name          = var.subnet-name
  ip_cidr_range = var.ip-cidr-range
  region        = var.region
  network       = google_compute_network.vpc_network.name

  # for secondary_ip_range
  # secondary_ip_range {
  #   range_name    = "tf-test-secondary-range-update1"
  #   ip_cidr_range = "192.168.10.0/24"
  # }
}

# create firewall 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
# resource "google_compute_firewall" "default" {
#   name    = "dev-firewall"
#   network = google_compute_network.vpc_network.name

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "8080"]
#   }
# }
