variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}