resource "aws_subnet" "publicsubnet" {
  vpc_id = aws_vpc.webvpc.id 
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
}
resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.webvpc.id 
  cidr_block = var.private_subnet_cidr
}