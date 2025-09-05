terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = "${var.env}-vpc"
  tags           = var.tags
}

module "subnet" {
  source               = "../../modules/subnet"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  env                  = var.env
  tags                 = var.tags
}

module "sg" {
  source        = "../../modules/security-group"
  vpc_id        = module.vpc.vpc_id
  sg_name       = "${var.env}-sg"
  ingress_cidrs = var.sg_ingress_cidrs
  egress_cidrs  = var.sg_egress_cidrs
  tags          = var.tags
}
