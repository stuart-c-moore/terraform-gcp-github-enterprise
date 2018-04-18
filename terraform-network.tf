resource "google_compute_address" "github" {
  name    = "github"
  region  = "${var.region}"
  project = "${var.project}"
}

resource "google_compute_network" "github" {
  name                    = "github"
  project                 = "${var.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "github" {
  name          = "github-${var.region}"
  network       = "${google_compute_network.github.self_link}"
  ip_cidr_range = "${var.github_cidr}"
}

resource "google_compute_firewall" "ingress-http" {
  name        = "ingress-http"
  description = "Web application access. All requests are redirected to the HTTPS port when SSL is enabled."
  count       = "${var.firewall-ingress-http-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"

  allow = {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "ingress-https" {
  name        = "ingress-https"
  description = "Web application and Git over HTTPS access."
  count       = "${var.firewall-ingress-https-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"

  allow = {
    protocol = "tcp"
    ports    = ["443"]
  }
}

resource "google_compute_firewall" "ingress-https-console" {
  name        = "ingress-https-console"
  description = "Secure web based Management Console. Required for basic installation and configuration."
  count       = "${var.firewall-ingress-https-console-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"

  allow = {
    protocol = "tcp"
    ports    = ["8443"]
  }
}
