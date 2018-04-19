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

variable "github-cidr" {
  default = "10.0.0.0/24"
}

variable "github-disk" {
  default = "100"
}

variable "github-version" {
  default = "2-13-1"
}

variable "github-machine_type" {
  default = "n1-standard-4"
}

variable "github-tag" {
  default = "github"
}

variable "network" {
  default = "github"
}