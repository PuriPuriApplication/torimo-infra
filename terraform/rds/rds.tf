resource "aws_rds_cluster" "cluster" {
  cluster_identifier              = format("%s-cluster", var.prefix)
  master_username                 = var.username
  master_password                 = var.password
  backup_retention_period         = 5
  preferred_backup_window         = "19:30-20:00"
  preferred_maintenance_window    = "wed:20:15-wed:20:45"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.rds-sg.id]
  db_subnet_group_name            = aws_db_subnet_group.subnet-group.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.cluster-param.name

  tags = {
    Name = format("%s-cluster", var.prefix)
  }
}

resource "aws_rds_cluster_instance" "instance" {
  count                   = var.instance_num
  identifier              = format("%s-rds-instance%s", var.prefix, count.index + 1)
  cluster_identifier      = aws_rds_cluster.cluster.id
  instance_class          = var.instance_class
  db_subnet_group_name    = aws_db_subnet_group.subnet-group.name
  db_parameter_group_name = aws_db_parameter_group.db-param.name

  tags = {
    Name = format("%s-rds-instance%s", var.prefix, count.index + 1)
  }
}
