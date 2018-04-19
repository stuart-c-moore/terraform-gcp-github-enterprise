# terraform-gcp-github-enterprise
A terraform module for deploying Github Enterprise to the Google Cloud Platform


Usage:

To accept all defaults, you only need the following:

```
module "terraform-gcp-github-enterprise" {
    source = "github.com/migs/terraform-gcp-github-enterprise"
    project = "${var.project}"
    region = "${var.region}"
}
```

All available options and their defaults are shown below:

```
module "terraform-gcp-github-enterprise" {
    source = "github.com/migs/terraform-gcp-github-enterprise"
    project = "${var.project}"
    region = "${var.region}"
    firewall-ingress-http-enabled = true
    firewall-ingress-https-enabled = true
    firewall-ingress-https-console-enabled = true
    github_version = "2-13-1"
    github_machine_type = "n1-standard-4"
    github_disk = "100"
    network = "github"
}
```