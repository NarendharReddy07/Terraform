provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "i3_for_tf" {
   ami = var.ami_value
   instance_type = var.instance_value
   tags = {
     Name="i3_for_tf"
   }
}
resource "aws_instance" "i4_for_tf" {
   ami = var.ami_value
   instance_type = var.instance_value
   tags = {
     Name="i3_for_tf"
   }
}

resource "aws_s3_bucket" "s3-demo" {
    bucket = "s3-demo-bucket-8790a"
    tags = {
      Name="firstBucket"
    }
  
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  
}