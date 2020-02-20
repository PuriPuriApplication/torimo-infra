resource "aws_ecr_repository" "ecr" {
  for_each = var.repos
  name     = format("%s-%s", var.prefix, each.key)
}
