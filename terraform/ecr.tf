resource "aws_ecr_repository" "ecr" {
  count = length(var.repo)
  name  = format("%s-%s", var.prefix, element(var.repo, count.index))
}
