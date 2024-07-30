terraform {
  backend "s3" {
    bucket = "backends3"
    key = "dev/terraform.state"
    region = "us-east-1"
  }
}