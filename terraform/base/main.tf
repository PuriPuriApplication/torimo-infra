provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "torimo-terraform"
    key    = "base/torimo.terraform.tfstate"
    region = "ap-northeast-1"
  }
}
