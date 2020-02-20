## SG
resource "aws_security_group" "rds-sg" {
  name   = format("%s-sg-rds", var.prefix)
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = format("%s-sg-rds", var.prefix)
  }
}

## Rule
resource "aws_security_group_rule" "rds_3306_worker" {
  security_group_id        = aws_security_group.rds-sg.id
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.base.outputs.worker_sg_id
}

resource "aws_security_group_rule" "rds_out" {
  security_group_id = aws_security_group.rds-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}
