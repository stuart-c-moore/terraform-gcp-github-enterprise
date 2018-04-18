resource "google_compute_address" "github" {
  name = "github"
}

resource "google_compute_network" "github" {
  name                    = "github"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "github" {
  name    = "github-${var.region}"
  network = "${google_compute_network.github.self_link}"
}

resource "google_compute_firewall" "ingress-http" {
  name        = "ingress-http"
  description = "Web application access. All requests are redirected to the HTTPS port when SSL is enabled."
  count       = "${var.firewall-ingress-http-enabled ? 1 : 0}"

  allow = {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "ingress-https" {
  name        = "ingress-https"
  description = "Web application and Git over HTTPS access."
  count       = "${var.firewall-ingress-https-enabled ? 1 : 0}"

  allow = {
    protocol = "tcp"
    ports    = ["443"]
  }
}
