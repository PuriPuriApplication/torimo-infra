provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = format("%s-terraform", var.prefix)
    key    = format("rds/%s.terraform.tfstate", var.prefix)
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "base" {
  backend = "s3"
  config = {
    bucket = format("%s-terraform", var.prefix)
    key    = format("base/%s.terraform.tfstate", var.prefix)
    region = "ap-northeast-1"
  }
}
