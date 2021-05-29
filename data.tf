data "aws_route53_zone" "jithendar" {
  name = "jithendar.com"
  private_zone = false
}

terraform {
  backend "s3" {
    bucket = "terraform-state-rs-practice"
    key    = "rs-instances/vpc.tfstate"
    region = "us-east-1"
  }
}

data "aws_availability_zones" "avz" {}