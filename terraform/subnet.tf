locals {
  base_tags = {
    format("kubernetes.io/cluster/%s-cluster", var.prefix) = "shared"
  }
  public_tags = merge(local.base_tags, map("kubernetes.io/role/elb", ""))
}

## ALB
resource "aws_subnet" "public" {
  count             = length(var.az)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = element(var.az, count.index)

  tags = merge(local.public_tags, map("Name", format("%s-public%s", var.prefix, count.index + 1)))
}

## EKS
resource "aws_subnet" "private" {
  count             = length(var.az)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + 10)
  availability_zone = element(var.az, count.index)

  tags = merge(local.base_tags, map("Name", format("%s-private%s", var.prefix, count.index + 1)))
}
