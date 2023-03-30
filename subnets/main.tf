resource "aws_subnet" "main" {
  count = length(var.cidr_block)
  vpc_id     = var.main_vpc
  cidr_block = var.cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]

  tags       = merge(
    local.common_tags,
    { Name = "${var.env}-${var.name}-subnet-${count.index+1}" }
  )
}

resource "aws_route_table" "r" {
  vpc_id = var.main_vpc

  route {
    cidr_block = data.aws_vpc.default_vpc_id.cidr_block
    pc_peering_connection_id = var.peering_id
  }

  tags       = merge(
    local.common_tags,
    { Name = "${var.env}-${var.name}-route-${count.index+1}" }
  )
}