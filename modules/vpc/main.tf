resource "aws_vpc" "dbx_vpc_dev" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.prefix}-vpc"
    Environment = var.prefix
  }
}


