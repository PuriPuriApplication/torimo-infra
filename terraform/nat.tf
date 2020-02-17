resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name = format("%s-eip", var.prefix)
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.0.id

  tags = {
    Name = format("%s-nat", var.prefix)
  }
}

resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = format("%s-private", var.prefix)
  }
}

resource "aws_route_table_association" "private-assoc" {
  count          = length(aws_subnet.private.*.id)
  route_table_id = aws_route_table.private-rtb.id
  subnet_id      = aws_subnet.private.*.id[count.index]
}
