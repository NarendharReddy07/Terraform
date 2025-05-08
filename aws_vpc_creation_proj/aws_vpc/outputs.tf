 output "vpc_id" {
    description = "id of the created vpc"
   value = aws_vpc.aws_vpc_r1.id
 }
 output "subnet_id" {
    description = "Id of the created subnet"
   value = aws_subnet.subnet.id
 }