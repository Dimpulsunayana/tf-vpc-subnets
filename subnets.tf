module "subnets" {
  source = "./subnets"

  env =var.env
  main_vpc = aws_vpc.main.id

  for_each = var.subnets
  public_subnets = each.value.public_subnets
  private_subnets = each.value.private_subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  name = each.value.name

}