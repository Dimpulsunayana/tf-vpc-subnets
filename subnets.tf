module "public_subnets" {
  source = "./subnets"
  availability_zone = var.availability_zone

  env =var.env
  main_vpc = aws_vpc.main.id
  peering_id = aws_vpc_peering_connection.vpc_peering.id
  #peering_id = var.peering_id
  for_each    = var.public_subnets
  default_vpc_id = var.default_vpc_id
  gateway_id = aws_internet_gateway.igw.id
 # nat_gateway_id = aws_nat_gateway.ngw.id
##  public_subnets = each.value.public_subnets
##  private_subnets = each.value.private_subnets
cidr_block = each.value.cidr_block
#availability_zone = each.value.availability_zone
  name = each.value.name
  internet_gw = lookup(each.value, "internet_gw" , false )
  nat_gw = lookup(each.value, "nat_gw" , false )

}

module "private_subnets" {
  source = "./subnets"
  availability_zone = var.availability_zone

  env =var.env
  main_vpc = aws_vpc.main.id
  peering_id = aws_vpc_peering_connection.vpc_peering.id
  #peering_id = var.peering_id
  for_each    = var.public_subnets
  default_vpc_id = var.default_vpc_id
  nat_gateway_id = aws_nat_gateway.ngw.id
  # nat_gateway_id = aws_nat_gateway.ngw.id
  ##  public_subnets = each.value.public_subnets
  ##  private_subnets = each.value.private_subnets
  cidr_block = each.value.cidr_block
  #availability_zone = each.value.availability_zone
  name = each.value.name
  internet_gw = lookup(each.value, "internet_gw" , false )
  nat_gw = lookup(each.value, "nat_gw" , false )

}

output "subnets" {
  value = module.subnets
}
