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

# VPC module
module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  prefix   = var.prefix
}

# Subnet module (call once per subnet if needed)
module "subnet_public" {
  source    = "../../modules/subnet"
  vpc_id    = module.vpc.vpc_id
  cidr_block = var.public_subnet_cidr
  prefix    = var.prefix
}

module "subnet_private" {
  source    = "../../modules/subnet"
  vpc_id    = module.vpc.vpc_id
  cidr_block = var.private_subnet_cidr
  prefix    = var.prefix
}

# Security Group module
module "sg" {
  source        = "../../modules/security-group"
  vpc_id        = module.vpc.vpc_id
  prefix        = var.prefix
  subnet_ids    = [module.subnet_public.subnet_id, module.subnet_private.subnet_id]
  service_names = ["app","db"]                # or whatever services
  allowed_cidrs = var.sg_allowed_cidrs
}

