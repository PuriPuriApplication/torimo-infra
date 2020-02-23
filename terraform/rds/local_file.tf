resource "local_file" "post" {
  filename        = "../../manifest/charts/post/values.yaml"
  file_permission = "0644"
  content         = <<EOF
user: ${var.username}
pass: ${var.password}
db: ${var.db_name}
endpoint: ${aws_rds_cluster.cluster.endpoint}:3306
EOF
}
