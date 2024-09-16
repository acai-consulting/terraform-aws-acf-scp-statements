output "scp_statements" {
  value = local.scp_statements
}

output "scp_statements_lengths" {
  value = {
    for key, doc in local.scp_statements : key => length(jsonencode(jsondecode(doc)))
  }
}
