terraform {
  backend "s3" {
    bucket = "aho-sf-vwis-tfstate"
    key = "static/iam/terraform.tfstate"
    region = "eu-west-1"
  }
}

