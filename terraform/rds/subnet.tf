## Subnet
resource "aws_subnet" "subnet" {
  count             = length(data.terraform_remote_state.base.outputs.az)
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = cidrsubnet(data.terraform_remote_state.base.outputs.cidr_block, 8, count.index + 250)
  availability_zone = element(data.terraform_remote_state.base.outputs.az, count.index)

  tags = {
    Name = format("%s-rds%s", data.terraform_remote_state.base.outputs.prefix, count.index + 1)
  }
}

## Route Table
resource "aws_route_table_association" "private-assoc" {
  count          = length(aws_subnet.subnet.*.id)
  route_table_id = data.terraform_remote_state.base.outputs.private_rtb
  subnet_id      = aws_subnet.subnet.*.id[count.index]
}

## Subnet Group
resource "aws_db_subnet_group" "subnet-group" {
  name       = format("%s-subnet-group", data.terraform_remote_state.base.outputs.prefix)
  subnet_ids = aws_subnet.subnet.*.id

  tags = {
    Name = format("%s-subnet-group", data.terraform_remote_state.base.outputs.prefix)
  }
}
