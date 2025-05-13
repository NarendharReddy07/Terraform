provider "aws" {
    region = "ap-south-1"
  
}

variable "instance_type" {
  description = "value"
  type = map(string)


   default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}
module "instance_creation" {
  source = "./modules/ec2_instance"
  ami_value = var.ami_value
  #instance_value = "t2.micro"
  instance_value = lookup(var.instance_type,terraform.workspace,"t2.micro")
}