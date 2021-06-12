
resource "aws_instance" "bastionhost" {
  ami                         = var.ami_id
  count                       = var.countinstance
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  subnet_id                   = var.subnet
  key_name                    = var.key_name
  tags = {
    Name = "${var.environment}-bastionhost"
  }
}

