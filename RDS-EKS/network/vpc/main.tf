resource "aws_vpc" "eks_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "eks_vpc"
  }
}

# internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "gw_id" {
  vpc_id = "${aws_vpc.eks_vpc.id}"

  tags {
    Name = "eks"
  }
}
