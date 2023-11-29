output "vpc" {
  value = aws_vpc.vpc
}

output "private_subnets" {
  value = local.privateSubnets
}

output "public_subnets" {
  value = local.publucSubnets
}