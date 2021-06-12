provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "webvpc" {
  cidr_block = var.cidr_block
  tags = {
    project = "WebProd"
  }
}