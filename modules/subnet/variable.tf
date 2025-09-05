variable "cidr_block" {
  description = "CIDR block for the dataplane VPC endpoint subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID where the subnet will be created"
  type        = string
}