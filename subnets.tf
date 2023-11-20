locals {
  privateSubnets = [
    aws_subnet.vpc_subnets[3].id, aws_subnet.vpc_subnets[4].id, aws_subnet.vpc_subnets[5].id 
  ]
  publucSubnets = [
    aws_subnet.vpc_subnets[0].id, aws_subnet.vpc_subnets[1].id, aws_subnet.vpc_subnets[2].id
  ]
}

resource "aws_ec2_tag" "public_subnet" {
  count       = length(local.publucSubnets)
  resource_id = element(local.publucSubnets, count.index)
  key         = "type"
  value       = "public"
}

resource "aws_ec2_tag" "private_subnet" {
  count       = length(local.privateSubnets)
  resource_id = element(local.privateSubnets, count.index)
  key         = "type"
  value       = "private"
}

resource "aws_subnet" "vpc_subnets" {
  count                   = length(data.aws_availability_zones.azs.names)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = random_shuffle.az_list.result[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  map_public_ip_on_launch = true
  tags = (merge(local.common_tags, tomap({
    "Name"                   = "${local.name_prefix}-subnet-${var.environment}-${count.index + 1}",
    "Purpose"                = "${local.common_tags["Team"]} multi AZ subnets",
    "karpenter.sh/discovery" = "${local.name_prefix}-cluster-${local.name_suffix}"
  })))
}