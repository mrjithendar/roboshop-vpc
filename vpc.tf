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
    cidr_block             = cidrsubnet(var.vpc_cidr,2, count.index)
    vpc_id                 = aws_vpc.vpc.id
    availability_zone      = element(data.aws_availablity_zones.name, count.index+1)
    tags                   = {
        name               = "${var.project}-${var.env}-public-subnet-${count.index+1}"
        environment        = var.env
        provisioned        = "terraform"
    } 
}

#cidrsubnet Function:
#cidrsubnet calculates a subnet address within given IP network address prefix. Ex= cidrsubnet(prefix, newbits, netnum).

#prefix must be given in CIDR notation, as defined.

#newbits is the number of additional bits with which to extend the prefix. For example, if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20.

#netnum is a whole number that can be represented as a binary integer with no more than newbits binary digits, which will be used to populate the additional bits added to the prefix.