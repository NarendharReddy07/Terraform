provider "aws" {
  region = "ap-south-1"
}

#calling  aws_vpc module
module "aws_vpc" {
  source = "./aws_vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

#creating ec2 instance in the subnet from module 
resource "aws_instance" "example_i2" {
  ami="ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  subnet_id = module.aws_vpc.subnet_id
  depends_on = [ module.aws_vpc ]
  tags = {
    Name="vpc_t2_instance"
  }
}

#output the ece instance's private ip
output "example_i2_instance_public_ip" {
    description = "public ip of instance example_i2"
    value = aws_instance.example_i2.private_ip
  
}