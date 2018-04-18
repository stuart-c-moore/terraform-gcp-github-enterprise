resource "google_compute_instance" "github" {
  name         = "github"
  machine_type = "${var.github_machine_type}"
  zone         = "${lookup(var.region_params["${var.region}"],"zone1")}"
  tags         = ["github"]

  boot_disk {
    initialize_params {
      image = "github-enterprise-public/github-enterprise-${var.github_version}"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.github.name}"

    access_config {
      nat_ip = "${google_compute_address.github.address}"
    }
  }
}
