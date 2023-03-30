output "subnet_ids" {
  subnet_ids = aws_subnet.main.*.id
}