resource "aws_internet_gateway" "igw" {
  vpc_id            = aws_vpc.vpc.id
    tags              = {
      name          = "${var.project}-${var.env}-igw"
      environemt    = var.env
      provisioned   = "terraform"
  }
}

resource "aws_eip" "eip" {
  vpc               = true
  tags              = {
      name          = "${var.project}-${var.env}-eip"
      environemt    = var.env
      provisioned   = "terraform"
  }
}

resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.eip.id
    subnet_id     = aws_subnet.public-subnets.*.id[0]
    #subnet_id     = element(aws_subnet.public-subnets.names)
    #element(data.aws_availability_zones.avz.names, count.index)
    tags              = {
      name          = "${var.project}-${var.env}-ngw"
      environemt    = var.env
      provisioned   = "terraform"
  }

}