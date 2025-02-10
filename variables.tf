variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
  default = "vpc-0aef794565d0f8b92"
}

variable "subnet_id" {
  type = string
  default = "subnet-0f6920415e50fd890"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
}

variable "cidr_block" {
  type = string
  default = "172.31.0.0/20"
}