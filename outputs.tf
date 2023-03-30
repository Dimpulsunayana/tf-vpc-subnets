output "main_vpc" {
  value = aws_vpc.main.id
}

output "peering_id" {
  value = aws_vpc_peering_connection.vpc_peering.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}