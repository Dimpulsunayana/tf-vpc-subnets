module "subnets" {
  source = "./subnets"
  availability_zone = var.availability_zone

  env =var.env
  main_vpc = aws_vpc.main.id
  vpc_id = aws_vpc.main.id
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  #peering_id = var.peering_id
  for_each    = var.public_subnets
  default_vpc_id = var.default_vpc_id
##  public_subnets = each.value.public_subnets
##  private_subnets = each.value.private_subnets
cidr_block = each.value.cidr_block
#availability_zone = each.value.availability_zone
  name = each.value.name

}

output "subnets" {
  value = module.subnets
}
