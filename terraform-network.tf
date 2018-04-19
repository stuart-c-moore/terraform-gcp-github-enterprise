resource "google_compute_address" "github" {
  name    = "github"
  region  = "${var.region}"
  project = "${var.project}"
}

resource "google_compute_network" "github" {
  name                    = "${var.network}"
  project                 = "${var.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "github" {
  name          = "github-${var.region}"
  network       = "${google_compute_network.github.self_link}"
  ip_cidr_range = "${var.github-cidr}"
}

resource "google_compute_firewall" "internet-to-github-http" {
  name        = "internet-to-github-http"
  description = "Web application access. All requests are redirected to the HTTPS port when SSL is enabled."
  count       = "${var.firewall-internet-to-github-http-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"
  target_tags = ["${var.github-tag}"]

  allow = {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "internet-to-github-https" {
  name        = "internet-to-github-https"
  description = "Web application and Git over HTTPS access."
  count       = "${var.firewall-internet-to-github-https-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"

  target_tags = ["${var.github-tag}"]

  allow = {
    protocol = "tcp"
    ports    = ["443"]
  }
}

resource "google_compute_firewall" "internet-to-github-https-console" {
  name        = "internet-to-github-https-console"
  description = "Secure web based Management Console. Required for basic installation and configuration."
  count       = "${var.firewall-internet-to-github-https-console-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"
  target_tags = ["${var.github-tag}"]

  allow = {
    protocol = "tcp"
    ports    = ["8443"]
  }
}

resource "google_compute_firewall" "internet-to-github-ssh-git" {
  name        = "internet-to-github-ssh-git"
  description = "Secure web based Management Console. Required for basic installation and configuration."
  count       = "${var.firewall-internet-to-github-ssh-git-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"
  target_tags = ["${var.github-tag}"]

  allow = {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "internet-to-github-ssh-shell" {
  name        = "internet-to-github-ssh-shell"
  description = "Secure web based Management Console. Required for basic installation and configuration."
  count       = "${var.firewall-internet-to-github-ssh-shell-enabled ? 1 : 0}"
  network     = "${google_compute_network.github.self_link}"
  target_tags = ["${var.github-tag}"]

  allow = {
    protocol = "tcp"
    ports    = ["122"]
  }
}