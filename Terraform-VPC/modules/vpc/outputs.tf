output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.my_subnets.*.id # we have multiple subnets which will be shown (it will be a list)
}