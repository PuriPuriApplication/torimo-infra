<<<<<<< HEAD
output "prefix" {
  value = var.prefix
}
=======
>>>>>>> origin/master
output "cidr_block" {
  value = var.cidr_block
}
output "az" {
  value = var.az
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "worker_sg_id" {
  value = aws_security_group.worker-sg.id
}
<<<<<<< HEAD
output "bastion_sg_id" {
  value = aws_security_group.bastion-sg.id
}
=======
>>>>>>> origin/master
output "private_rtb" {
  value = aws_route_table.private-rtb.id
}
output "private_r53" {
  value = aws_route53_zone.local.zone_id
}
