resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.Igw_id
  }
  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  # No internet route, only local routes

  tags = {
    Name = "${var.name}-private-rt"
  }
}


resource "aws_route_table_association" "public_rsa" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_rsa" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = aws_route_table.private.id
}
