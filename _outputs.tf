output "accepter_route_table_id_secure" {
  value = data.aws_route_table.accepter_secure.*.route_table_id
}
