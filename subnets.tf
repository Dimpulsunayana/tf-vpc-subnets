module "subnets" {
  source = "./subnets"

  env =var.env
  main_vpc = aws_vpc.main.id
}