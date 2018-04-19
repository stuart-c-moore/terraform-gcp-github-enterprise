Create a terraform-variables.tf file, and populate it with something like this:

```
variable "project" { default = "some-gcp-project-name"}
variable "region" { default = "europe-west2"}
```

terraform-variables.tf is in the .gitignore file, so project names don't accidently end up in github ...