resource "aws_route_table" "PublicRouteTable" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet-gateway
  }
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-PublicRouteTable"
  }
  )
}

resource "aws_route_table_association" "PublicRouteTableAssociation" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat-gateway
  }
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-PrivateRouteTable"
  }
  )
}

resource "aws_route_table_association" "PrivateRouteTableAssociation" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.PrivateRouteTable.id
}