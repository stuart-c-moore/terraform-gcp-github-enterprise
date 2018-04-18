resource "google_compute_disk" "github" {
  name = "github"
  type = "pd-ssd"
  zone = "${lookup(var.region_params["${var.region}"],"zone1")}"
  size = "${var.github_disk}"
}

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

  attached_disk {
    source = "${google_compute_disk.github.self_link}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.github.name}"

    access_config {
      nat_ip = "${google_compute_address.github.address}"
    }
  }
}
