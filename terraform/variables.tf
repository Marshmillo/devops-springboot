variable "jenkins-ami-id" {
  description = "ID of AMI to use for the instance"
  type        = string
}
variable "jenkins-instance_type" {
  description = "The type of instance to start"
  type        = string
}
variable "jenkins-key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}