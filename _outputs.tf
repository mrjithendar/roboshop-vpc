output "vpc" {
  value = aws_vpc.vpc
}

output "subnets" {
  value = aws_subnet.vpc_subnets
}


# Outputs:
# vpc = {
#   "arn" = "arn:aws:ec2:us-east-1:826334059644:vpc/vpc-0f8a582f854b66721"
#   "assign_generated_ipv6_cidr_block" = false
#   "cidr_block" = "10.0.0.0/16"
#   "default_network_acl_id" = "acl-0fd0d49cc02b6507e"
#   "default_route_table_id" = "rtb-0977da8bed129fbfe"
#   "default_security_group_id" = "sg-00664a365c698726b"
#   "dhcp_options_id" = "dopt-08b38bb194796668b"
#   "enable_dns_hostnames" = true
#   "enable_dns_support" = true
#   "enable_network_address_usage_metrics" = false
#   "id" = "vpc-0f8a582f854b66721"
#   "instance_tenancy" = "default"
#   "ipv4_ipam_pool_id" = tostring(null)
#   "ipv4_netmask_length" = tonumber(null)
#   "ipv6_association_id" = ""
#   "ipv6_cidr_block" = ""
#   "ipv6_cidr_block_network_border_group" = ""
#   "ipv6_ipam_pool_id" = ""
#   "ipv6_netmask_length" = 0
#   "main_route_table_id" = "rtb-0977da8bed129fbfe"
#   "owner_id" = "826334059644"
#   "tags" = tomap({
#     "Createdby" = "Terraform"
#     "Email" = "team@decodedevops.com"
#     "Environment" = "dev"
#     "Name" = "DKODE-cluster-vpc-dev"
#     "Organization" = "Decode DevOps"
#     "Purpose" = "vpc for DKODE Tech"
#     "Role" = "Trainer"
#     "Team" = "DKODE Tech"
#   })
#   "tags_all" = tomap({
#     "Createdby" = "Terraform"
#     "Email" = "team@decodedevops.com"
#     "Environment" = "dev"
#     "Name" = "DKODE-cluster-vpc-dev"
#     "Organization" = "Decode DevOps"
#     "Purpose" = "vpc for DKODE Tech"
#     "Role" = "Trainer"
#     "Team" = "DKODE Tech"
#   })
# }