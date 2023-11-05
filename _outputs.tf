output "vpc" {
  value = aws_vpc.vpc
}

output "subnets" {
  value = aws_subnet.vpc_subnets
}