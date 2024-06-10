resource "aws_nat_gateway" "natgw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet1.id
  
  tags = {
        Name = "${local.project}-natgw1"
        project = local.project
  }

  depends_on = [aws_internet_gateway.igw]
}