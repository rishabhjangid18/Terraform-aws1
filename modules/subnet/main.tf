resource "aws_subnet" "this" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.prefix}-${var.cidr_block}-tikisubnet"
    Environment = var.prefix
  }
}
