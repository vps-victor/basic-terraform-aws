terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "orgName"

    workspaces {
      name = "aws-orgName"
    }
  }
}