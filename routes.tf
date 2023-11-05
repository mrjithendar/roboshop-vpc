resource "aws_route_table" "pr_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
  tags = (merge(local.common_tags, tomap({
    "Name"    = "${local.name_prefix}-private-rt-${var.environment}",
    "Purpose" = "${local.common_tags["Team"]} private route table"
  })))
}

resource "aws_route_table_association" "pr_rta" {
  count          = length(local.privateSubnets)
  subnet_id      = element(local.privateSubnets, count.index)
  route_table_id = aws_route_table.pr_rt.id
}

resource "aws_route_table" "pl_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = (merge(local.common_tags, tomap({
    "Name"    = "${local.name_prefix}-public-rt-${var.environment}",
    "Purpose" = "${local.common_tags["Team"]} public route table"
  })))
}

resource "aws_route_table_association" "pl_rta" {
  count          = length(local.publucSubnets)
  subnet_id      = element(local.publucSubnets, count.index)
  route_table_id = aws_route_table.pl_rt.id
}