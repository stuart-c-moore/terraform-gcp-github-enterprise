variable "project" {}
variable "region" {}

variable "firewall-internet-to-github-http-enabled" {
  default = true
}

variable "firewall-internet-to-github-https-enabled" {
  default = true
}

variable "firewall-internet-to-github-https-console-enabled" {
  default = true
}

variable "github_version" {
  default = "2-13-1"
}

variable "github_machine_type" {
  default = "n1-standard-4"
}

variable "github_disk" {
  default = "100"
}

variable "github_cidr" {
  default = "10.0.0.0/24"
}

variable "network" {
  default = "github"
}