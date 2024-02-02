locals {
  common_tags = merge(local.our_tags, var.userid != "" ? tomap({ "Role" = trimprefix("Trainer", "-") }) : tomap({}))
  our_tags = {
    Team         = "DKODE Tech"
    Email        = "team@decodedevops.com"
    Environment  = var.environment
    Organization = "Decode DevOps"
    Createdby    = "Terraform"
  }
  name_prefix = "DKODE"
  name_suffix = var.environment
  privateSubnets = [ aws_subnet.vpc_subnets[2].id, aws_subnet.vpc_subnets[3].id, aws_subnet.vpc_subnets[4].id ]
  publucSubnets = [ aws_subnet.vpc_subnets[0].id, aws_subnet.vpc_subnets[1].id ]
}
