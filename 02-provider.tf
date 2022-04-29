provider "google" {
  credentials = file("${var.service-account}")
  project     = var.project-name
  region      = var.region
}
