variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
}
variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}
variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}
variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = null
}
variable "vpc_id" {
  description = "The VPC ID to launche SG"
  type        = string
}