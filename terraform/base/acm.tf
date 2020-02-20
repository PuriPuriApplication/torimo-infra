resource "aws_acm_certificate" "acm" {
  domain_name               = var.domain
  subject_alternative_names = [format("*.%s", var.domain)]
  validation_method         = "DNS"

  tags = {
    Name = var.domain
  }
}
