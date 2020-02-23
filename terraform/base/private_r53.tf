## Hosted zone
resource "aws_route53_zone" "local" {
  name    = format("%s.local", var.prefix)
  comment = "only aws internal dns"

  vpc {
    vpc_id = aws_vpc.vpc.id
  }
}
