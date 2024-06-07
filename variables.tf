variable "prefix" {
  type        = string
  description = "The prefix to be used for naming resources"
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "subnet1_cidr" {
  type        = string
  description = "The CIDR block for subnet 1"
}

variable "subnet2_cidr" {
  type        = string
  description = "The CIDR block for subnet 2"
}

variable "subnet3_cidr" {
  type        = string
  description = "The CIDR block for subnet 3"
}

variable "subnet4_cidr" {
  type        = string
  description = "The CIDR block for subnet 4"
}

variable "subnet5_cidr" {
  type        = string
  description = "The CIDR block for subnet 5"
}

variable "subnet6_cidr" {
  type        = string
  description = "The CIDR block for subnet 6"
}
