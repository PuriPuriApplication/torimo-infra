resource "aws_ecr_repository" "ecr" {
  for_each = var.repos
  name     = each.key
}
