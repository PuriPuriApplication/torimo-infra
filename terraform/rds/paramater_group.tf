resource "aws_db_parameter_group" "db-param" {
  name   = format("%s-db-param", var.prefix)
  family = var.db_version

  tags = {
    Name = format("%s-db-param", var.prefix)
  }
}

resource "aws_rds_cluster_parameter_group" "cluster-param" {
  name   = format("%s-cluster-param", var.prefix)
  family = var.db_version

  tags = {
    Name = format("%s-cluster-param", var.prefix)
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
