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
    allocation_id = [aws_eip.eip]
    subnet_id     = [aws_subnet.public-subnets.*[0]]
    tags              = {
      name          = "${var.project}-${var.env}-ngw"
      environemt    = var.env
      provisioned   = "terraform"
  }

}