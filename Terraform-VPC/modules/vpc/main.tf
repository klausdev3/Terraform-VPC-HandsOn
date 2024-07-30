# VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# 2 Subnets

resource "aws_subnet" "my_subnets" {
    count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]  
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = var.subnet_names[count.index]
  }
}


# Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}

# Route Table

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "my_route_table"
  }
}

# Route Table Association

resource "aws_route_table_association" "my_route_table_association" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.my_subnets[count.index].id
  route_table_id = aws_route_table.my_route_table.id
}
  