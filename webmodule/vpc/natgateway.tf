resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.privatesubnet.id

  tags = {
    project = "WebProd"
  }
  depends_on = [aws_internet_gateway.igw]
}