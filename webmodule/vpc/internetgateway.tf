resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.webvpc.id

  tags = {
    project = "WebProd"
  }
}