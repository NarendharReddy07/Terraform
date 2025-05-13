variable "ami_value" {
  description = "value for ami"
  default = "ami-0e35ddab05955cf57"
}

variable "instance_value" {
    description = "type of instance to be created"
    default = "t2.micro"
  
}

variable "cidr_value" {
    default = "10.0.0.0/16"
  
}