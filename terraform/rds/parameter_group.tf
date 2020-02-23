resource "aws_db_parameter_group" "db-param" {
  name   = format("%s-db-param", data.terraform_remote_state.base.outputs.prefix)
  family = var.db_version

  tags = {
    Name = format("%s-db-param", data.terraform_remote_state.base.outputs.prefix)
  }
}

resource "aws_rds_cluster_parameter_group" "cluster-param" {
  name   = format("%s-cluster-param", data.terraform_remote_state.base.outputs.prefix)
  family = var.db_version

  tags = {
    Name = format("%s-cluster-param", data.terraform_remote_state.base.outputs.prefix)
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
