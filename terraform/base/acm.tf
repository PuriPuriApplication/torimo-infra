resource "aws_acm_certificate" "acm" {
  domain_name               = var.domain
  subject_alternative_names = [format("*.%s", var.domain)]
  validation_method         = "DNS"

  tags = {
    Name = var.domain
  }
}

resource aws_acm_certificate_validation "cert" {
  certificate_arn = aws_acm_certificate.acm.arn
  validation_record_fqdns = [aws_route53_record.acm.fqdn]
}
