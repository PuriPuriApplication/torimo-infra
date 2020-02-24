resource "local_file" "cluster" {
  filename        = "../../helm/values.yaml"
  file_permission = "0644"
  content         = <<EOF
cluster:
  enable: false
controller:
  enable: false
ingress:
  enable: false
prefix: ${var.prefix}
vpcId: "${aws_vpc.vpc.id}"
vpcCidr: "${aws_vpc.vpc.cidr_block}"
private1Id: "${aws_subnet.private.0.id}"
private1Cidr: "${aws_subnet.private.0.cidr_block}"
private1AZ: "${aws_subnet.private.0.availability_zone}"
private2Id: "${aws_subnet.private.1.id}"
private2Cidr: "${aws_subnet.private.1.cidr_block}"
private2AZ: "${aws_subnet.private.1.availability_zone}"
public1Id: "${aws_subnet.public.0.id}"
public1Cidr: "${aws_subnet.public.0.cidr_block}"
public1AZ: "${aws_subnet.public.0.availability_zone}"
public2Id: "${aws_subnet.public.1.id}"
public2Cidr: "${aws_subnet.public.1.cidr_block}"
public2AZ: "${aws_subnet.public.1.availability_zone}"
albSG: "${aws_security_group.alb-sg.id}"
workerSG: "${aws_security_group.worker-sg.id}"
role: "${aws_iam_role.role.arn}"
acm: "${aws_acm_certificate.acm.arn}"
EOF
}

resource "local_file" "manifest" {
  filename        = "../../manifest/values.yaml"
  file_permission = "0644"
  content         = <<EOF
global:
  core: ${aws_ecr_repository.ecr["torimo-core"].repository_url}:${lookup(var.repos, "torimo-core")}
  post: ${aws_ecr_repository.ecr["torimo-post-api"].repository_url}:${lookup(var.repos, "torimo-post-api")}
  migration: ${aws_ecr_repository.ecr["torimo-migration"].repository_url}:${lookup(var.repos, "torimo-migration")}
EOF
}
