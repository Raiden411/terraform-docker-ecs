terraform {
  backend "s3" {
    bucket = "aho-sf-vwis-tfstate"
    key    = "temp-jks-sa/terraform.tfstate"
    region = "eu-west-1"
  }
}
