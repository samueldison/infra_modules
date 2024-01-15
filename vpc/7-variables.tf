variable "env" {
  description = "Environment Name."
  type        = string 
}

variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter Domain Routing)"
  type        = string
  default = "192.68.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR range for private subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR range for public subnets."
  type = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnet tags."
  type = map(any)
}

variable "public_subnet_tags" {
  description = "Public subnet tags."
  type = map(any)
}

