terraform {
  backend "s3" {}
}

provider "aws" {
  profile = var.profile
  version = "3.9.0"
  region  = var.region
}
