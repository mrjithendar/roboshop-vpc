resource "aws_vpc" "vpc" {
    cidr_block            = var.vpc_cidr
    enabale_dns_hostnames = true
    enable_dns_support    = true
    tags = {
      Name                 = "${var.project}-${var.env}"
      environment          = var.env
      provisoned           = "terraform"
    }
}

resource "aws_subnet" "private-subnets" {
    count                  = 2
    cidr_block             = cidrsubnet(var.vpc_cidr,2, count.index)
    vpc_id                 = aws_vpc.vpc.id
    availability_zone      = element(data.aws_availablity_zones.avz.names, count.index)
    tags                   = {
        name               = "${var.project}-${var.env}-private-subnet-${count.index+1}"
        environment        = var.env
        provisioned        = "terraform" 
    } 
}

resource "aws_subnet" "public-subnets" {
    count                  = 2
    cidr_block             = cidrsubnet(var.vpc_cidr,2, count.index+2)
    vpc_id                 = aws_vpc.vpc.id
    availability_zone      = element(data.aws_availablity_zones.name, count.index+1)
    tags                   = {
        name               = "${var.project}-${var.env}-public-subnet-${count.index+1}"
        environment        = var.env
        provisioned        = "terraform"
    } 
}