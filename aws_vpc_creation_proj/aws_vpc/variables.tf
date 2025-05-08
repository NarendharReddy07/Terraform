variable "vpc_cidr" {
  description = "cidr block for the vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "cidr block for subnet"
    type = string
    default = "10.0.0.0/24"
  
}