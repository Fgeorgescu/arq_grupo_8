# Input variable definitions

variable "client_name" {
    description = "Name for the client"
    type = string
}

variable "tags" {
  description = "Tags to set on the instance."
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Instance type that will be used as slave"
  type = string
  default = "t2.micro"
}

variable "slave_cidr_block" {
  description = "cidr block used to generate a subnet for this components"
  type = string
}

variable "master_sg_id" {
  description = "cidr block used to generate a subnet for this components"
  type = string
}

variable "slave_sg_id" {
  description = "cidr block used to generate a subnet for this components"
  type = string
}

variable "desired_capacity" {
  description = "cidr block used to generate a subnet for this components"
  type = string
  default = 1
}
variable "max_size" {
  description = "cidr block used to generate a subnet for this components"
  type = string
  default = 3
}
variable "min_size" {
  description = "cidr block used to generate a subnet for this components"
  type = string
  default = 0
}