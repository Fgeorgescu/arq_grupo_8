# Input variable definitions

variable "instance_name" {
    description = "Name for the master instance"
    type = string
}

variable "tags" {
  description = "Tags to set on the instance."
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Instance type that will be used as master"
  type = string
  default = "t2.micro"
}

variable "master_cidr_block" {
  description = "cidr block used to generate a subnet for this components"
  type = string
}