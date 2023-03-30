variable "env" {}
variable "main_vpc" {}
variable "cidr_block" {}
variable "name" {}
variable "availability_zone" {}
variable "peering_id" {}
variable "default_vpc_id" {}
variable "internet_gw" {}
variable "gateway_id" {
  default = null
}
variable "nat_gateway_id" {
  default = null
}
variable "nat_gw" {}