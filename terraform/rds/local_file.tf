resource "local_file" "manifest" {
  filename        = "../../manifest/charts/post/values.yaml"
  file_permission = "0644"
  content         = <<EOF
user: ${var.username}
pass: ${var.password}
db: ${var.db_name}
endpoint: ${aws_rds_cluster.cluster.endpoint}:3306
EOF
}

resource "local_file" "migration" {
  filename        = "../../DDL/.env"
  file_permission = "0644"
  content         = <<EOF
DB_USER=${var.username}
DB_PASSWORD=${var.password}
DB_NAME=${var.db_name}
DB_URL=${aws_rds_cluster.cluster.endpoint}:3306
EOF
}
