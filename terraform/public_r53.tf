## Hosted zone
resource "aws_route53_zone" "zone" {
  name          = var.domain
  force_destroy = true
}

## Records
### NS
resource "aws_route53_record" "ns" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain
  type    = "NS"
  ttl     = 172800

  allow_overwrite = false

  records = var.ns
}

### Domain validation
resource "aws_route53_record" "acm" {
  count   = length(aws_acm_certificate.acm.domain_validation_options)
  zone_id = aws_route53_zone.zone.zone_id
  name    = aws_acm_certificate.acm.domain_validation_options[count.index]["resource_record_name"]
  type    = aws_acm_certificate.acm.domain_validation_options[count.index]["resource_record_type"]
  ttl     = "300"
  records = [aws_acm_certificate.acm.domain_validation_options[count.index]["resource_record_value"]]
}
