## VPC
resource "aws_vpc" "vpc" {
  cidr_block         = var.cidr_block
  enable_dns_support = true

  tags = {
    Name = format("%s-vpc", var.prefix)
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

## vpc dhcp option
resource "aws_vpc_dhcp_options_association" "dhcp" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.local-domain.id
}

## vpc dhcp option
resource "aws_vpc_dhcp_options" "local-domain" {
  domain_name         = format("%s.local", var.prefix)
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = format("%s-local", var.prefix)
  }
}

## Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-igw", var.prefix)
  }
}

## Route Table
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = format("%s-rtb", var.prefix)
  }
}

resource "aws_main_route_table_association" "rtb-assoc" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.rtb.id
}
