data "aws_vpc" "default" {
  filter {
    name = "tag:Name"
    values = ["Default"]
  }
}

data "aws_availability_zones" "azs" {}