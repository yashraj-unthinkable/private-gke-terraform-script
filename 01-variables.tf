variable "project-name" {
  type    = string
  default = "yashraj-347308"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "service-account" {
  type    = string
  default = "service-account.json"
}

variable "vpc-name" {
  type    = string
  default = "dev-vpc"
}

variable "vpc-description" {
  type    = string
  default = "VPC for GKE cluster"
}

variable "auto-create-subnet" {
  type    = bool
  default = false
}

variable "subnet-name" {
  type    = string
  default = "dev-vpc-subnet-1"
}


variable "ip-cidr-range" {
  type    = string
  default = "10.2.0.0/16"
}

variable "cluster-name" {
  type    = string
  default = "dev-cluster"
}

variable "node-pool-name" {
  type    = string
  default = "node-pool-1"
}

variable "preemptible-machine-type" {
  type    = string
  default = "e2-standard-2"
}

variable "master-ipv4-cidr-block" {
  type    = string
  default = "172.16.0.0/28"
}

variable "enable-private-endpoint" {
  type    = bool
  default = false
}

variable "enable-private-nodes" {
  type    = bool
  default = true
}

variable "no-of-nodes" {
  type    = number
  default = 1
}

variable "router-name" {
  type    = string
  default = "dev-vpc-router"
}

variable "nat-gateway-name" {
  type    = string
  default = "dev-vpc-nat"
}

variable "export-nat-logs" {
  type    = bool
  default = true
}

variable "auto-upgrade-node" {
  type    = bool
  default = false
}

variable "auto-repair-node" {
  type    = bool
  default = true
}
