## ALB
resource "aws_security_group" "alb-sg" {
  name   = format("%s-sg-alb", var.prefix)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-sg-alb", var.prefix)
  }
}

resource "aws_security_group_rule" "alb_443_internet" {
  security_group_id = aws_security_group.alb-sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.allow_ip
//  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow internet access."
}

resource "aws_security_group_rule" "alb_out" {
  security_group_id = aws_security_group.alb-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}

## Worker
resource "aws_security_group" "worker-sg" {
  name   = format("%s-sg-worker", var.prefix)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-sg-worker", var.prefix)
  }
}

resource "aws_security_group_rule" "worker_any_vpc" {
  security_group_id = aws_security_group.worker-sg.id
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block]
  description       = "Allow resources in vpc to access worker node."
}

resource "aws_security_group_rule" "worker_any_master" {
  security_group_id        = aws_security_group.worker-sg.id
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.master-sg.id
  description              = "Allow master node to access worker node"
}

resource "aws_security_group_rule" "worker_any_self" {
  security_group_id = aws_security_group.worker-sg.id
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  self              = true
  description       = "Allow internal access."
}

resource "aws_security_group_rule" "worker_out" {
  security_group_id = aws_security_group.worker-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}

## Master
resource "aws_security_group" "master-sg" {
  name   = format("%s-sg-master", var.prefix)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-sg-master", var.prefix)
  }
}

resource "aws_security_group_rule" "master_443_worker" {
  security_group_id        = aws_security_group.master-sg.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.worker-sg.id
  description              = "Allow worker node to access master node."
}

resource "aws_security_group_rule" "master_out" {
  security_group_id = aws_security_group.master-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}
