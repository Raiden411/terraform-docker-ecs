terraform {
  backend "s3" {
    bucket = "aho-sf-vwis-tfstate"
    key    = "common/terraform.tfstate"
    region = "eu-west-1"
  }
}
