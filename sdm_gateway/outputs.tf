output "sdm_gateway_ids" {
  value = {
    for instance in aws_instance.gateway :
    instance.tags.Name => instance.id
  }
}
output "sdm_gateway_ips" {
  value = {
    for instance in aws_instance.gateway :
    instance.tags.Name => instance.public_ip
  }
}
output "gateway_security_group_id" {
  value       = aws_security_group.this["gateway"].id
  description = "The ID of the gateway security group if created"
}

