resource "aws_subnet" "main" {
  vpc_id     = main_vpc
  cidr_block = "10.0.1.0/24"

  tags       = merge(
    local.common_tags,
    { Name = "${var.env}-vpc" }
  )
}