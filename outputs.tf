output "main_vpc" {
  value = aws_vpc.main.id
}

output "peering_id" {
  value = aws_vpc_peering_connection.vpc_peering.id
}

output "public_subnet_ids" {
  value = module.public_subnets
}

output "private_subnet_ids" {
  value = module.private_subnets
}
