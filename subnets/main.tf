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
    vpc_peering_connection_id = var.peering_id
  }

  tags       = merge(
    local.common_tags,
    { Name = "${var.env}-${var.name}-route" }
  )
  lifecycle {
    ignore_changes = [
      route,
    ]
  }
}

resource "aws_route_table_association" "association" {
  count          = length(aws_subnet.main)
  subnet_id      = aws_subnet.main.*.id[count.index]
  route_table_id = aws_route_table.r.id
}

resource "aws_route" "igw_route" {
  count = var.internet_gw ? 1:0
  route_table_id            = aws_route_table.r.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = var.gateway_id
}

resource "aws_route" "ngw_route" {
  count = var.nat_gw ? 1:0
  route_table_id            = aws_route_table.r.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = var.nat_gateway_id
}