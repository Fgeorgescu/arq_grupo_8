# Input variable definitions

variable "instance_name" {
    description = "Name for the master instance"
    type = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}