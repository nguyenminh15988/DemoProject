resource "aws_subnet" "eks_subnets" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "eks_subnets"
  }
}

