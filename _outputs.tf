output "vpc" {
  value = aws_vpc.vpc
}

output "private_subnets" {
  value = local.privateSubnets
}

output "public_subnets" {
  value = local.publucSubnets
}

output "public_rt" {
  value = aws_route_table.pl_rt
}

output "private_rt" {
  value = aws_route_table.pr_rt
}