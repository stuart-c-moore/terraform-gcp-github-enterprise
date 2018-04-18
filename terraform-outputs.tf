output "public-ip" {
  value = "${google_compute_address.github.address}"
}
