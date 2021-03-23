variable "name" {
  description = "The eks name to use for the cluster"
  type        = string
  default     = ""
}
variable "subnet_ids" {
  description = "The VPC Subnet ID to launch in"
  type        = list(string)
}