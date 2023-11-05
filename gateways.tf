resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = (merge(local.common_tags, tomap({
    "Name"    = "${local.name_prefix}-cluster-igw-${var.environment}",
    "Purpose" = "igw for ${local.common_tags["Team"]}"
  })))
}

resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.id
  subnet_id         = local.publucSubnets[0]
  tags = (merge(local.common_tags, tomap({
    "Name"    = "${local.name_prefix}-nat-gateway-1-${var.environment}",
    "Purpose" = "${local.common_tags["Team"]} nat gateway"
  })))
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "eip" {
  tags = (merge(local.common_tags, tomap({
    "Name"    = "${local.name_prefix}-eip-${var.environment}",
    "Purpose" = "${local.common_tags["Team"]} eip"
  })))
}