output "id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.instance.id
}

output "address" {
  description = "Address which the RDS instance is bound to"
  value       = aws_db_instance.instance.address
}

output "port" {
  description = "Port which the RDS instance exposes (e.g. 5432)"
  value       = aws_db_instance.instance.port
}

output "sg_id" {
  description = "ID of the security group attached to the RDS instance"
  value       = aws_security_group.sg.id
}
