module "terraform-gcp-github-enterprise" {
  source  = "github.com/migs/terraform-gcp-github-enterprise"
  project = "${var.project}"
  region  = "${var.region}"
}
