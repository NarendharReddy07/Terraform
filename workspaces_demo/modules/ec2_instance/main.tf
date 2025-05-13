provider "aws" {
  region = "ap-south-1"
}

#these both variables are for dummy if you don't specify here then in resource it will throw error
variable "ami_value" {
  description = "value"
}
variable "instance_value" {
  description = "value"
}

resource "aws_instance" "instance" {
  tags = {
    Name="inst@nce"
  }
  ami = var.ami_value
  instance_type=var.instance_value
}