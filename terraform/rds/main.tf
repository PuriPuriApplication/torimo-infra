provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "torimo-terraform"
    key    = "rds/torimo.terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "base" {
  backend = "s3"
  config = {
    bucket = "torimo-terraform"
    key    = "base/torimo.terraform.tfstate"
    region = "ap-northeast-1"
  }
}
