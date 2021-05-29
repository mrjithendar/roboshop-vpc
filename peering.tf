resource "aws_vpc_peering_connection" "vpc-peering" {
    peer_vpc_id = aws_vpc.vpc.id
    vpc_id      = var.vpc_id
    auto_accept = true

    tags        = {
        name    = "peering between ${var.project}-${var.env}-vpc and default vpc"
    }
}