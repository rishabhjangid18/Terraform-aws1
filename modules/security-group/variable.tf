variable "prefix"        { type = string }
variable "vpc_id"        { type = string }
variable "subnet_ids"    { type = list(string) }
variable "service_names" { type = list(string) }
variable "allowed_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/8"]
}
