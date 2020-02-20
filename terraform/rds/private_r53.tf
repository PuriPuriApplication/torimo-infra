resource "aws_route53_record" "rds" {
  zone_id = data.terraform_remote_state.base.outputs.private_r53
  name    = format("%s-rds", var.prefix)
  type    = "CNAME"
  ttl     = "300"

  records = [aws_rds_cluster.cluster.endpoint]
}
