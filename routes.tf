resource "aws_route_table" "public" {
  vpc_id            = aws_vpc.vpc.id
  route {
      cidr_block    = "0.0.0.0/0"
      gateway_id    = aws_internet_gateway.igw.id
  }
  route {
      cidr_block                = var.default_vpc_cidr
      vps_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags {
      name          = "${var.project}-${var.env}-pub-rtable"
      environment   = var.env
      provisioned   = "terraform"
  }
}

resource "aws_route_table_association" "private" {
    count           = 2
    route_table_id  = aws_route_table.private.id 
    subnet_id       = element(aws_subnet.public-subnets.*.id,count.index)
}

resource "aws_route_table_association" "private" {
    vpc_id          = aws_vpc.vpc.id
    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_nat_gateway.ngw.id
    }
    route {
        cidr_block                = var.default_vpc_cidr
        vps_peering_connection_id = aws_vpc_peering_connection.peering.id
    }
    tags {
        name        = "${var.project}-${var.env}-pri-rtable"
        environemt  = var.env
        provisioned = "terraform"
    }
}

resource "aws_route_table_association" "private" {
  count             = 2
  route_table_id    = aws_route_table.private.id
  subnet_id         = element(aws_subnet.private-subnets.*.id,count.index)
}

resource "aws_route" "default-rt-route" {
  route_table_id            = var.default_rt
  destination_cidr_block    = aws_vpc.vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}