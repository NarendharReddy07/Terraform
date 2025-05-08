resource "aws_vpc" "aws_vpc_r1" {
   cidr_block = var.vpc_cidr
    tags = {
      Name="example-vpc"
    }
}
resource "aws_subnet" "subnet" {

   vpc_id = aws_vpc.aws_vpc_r1.id
   cidr_block = var.subnet_cidr
   tags = {
     Name="example-subnet"
   }
}