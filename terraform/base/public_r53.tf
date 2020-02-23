## Hosted zone
data "aws_route53_zone" "zone" {
  name = var.domain
}

## Records
resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name = format("bastion")
  type = "A"
  ttl = "300"
  records = [aws_instance.bastion.public_ip]
}


### Domain validation
resource "aws_route53_record" "acm" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = aws_acm_certificate.acm.domain_validation_options[0]["resource_record_name"]
  type    = aws_acm_certificate.acm.domain_validation_options[0]["resource_record_type"]
  ttl     = "300"
  records = [aws_acm_certificate.acm.domain_validation_options[0]["resource_record_value"]]
}
