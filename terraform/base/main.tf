provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
<<<<<<< HEAD:terraform/base/main.tf
    bucket = "torimo-terraform"
    key    = "base/torimo.terraform.tfstate"
=======
    bucket = format("%s-terraform", var.prefix)
    key    = format("base/%s.terraform.tfstate", var.prefix)
>>>>>>> origin/master:terraform/main.tf
    region = "ap-northeast-1"
  }
}
