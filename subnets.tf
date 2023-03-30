module "subnets" {
  source = "./subnets"

  env =var.env
  main_vpc = aws_vpc.main.id

  for_each = var.subnets1
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  name = each.value.name

}