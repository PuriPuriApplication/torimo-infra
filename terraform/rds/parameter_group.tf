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
    name         = "character_set_client"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_connection"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_filesystem"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_results"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_connection"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_server"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
