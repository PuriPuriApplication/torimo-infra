provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = format("%s-terraform", var.prefix)
    key    = format("base/%s.terraform.tfstate", var.prefix)
    region = "ap-northeast-1"
  }
}
