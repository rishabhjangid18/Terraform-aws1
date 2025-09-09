# AWS region
variable "region" {
  type    = string
  default = "ap-south-1"
}

# Prefix for resource names
variable "prefix" {
  type    = string
  default = "prod"
}

# VPC CIDR block
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Subnet CIDRs
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

# Security Group allowed CIDRs
variable "sg_allowed_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/8"]
}

# Security Group service names
variable "sg_service_names" {
  type    = list(string)
  default = ["app","db"]
}
