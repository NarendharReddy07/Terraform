terraform {
  backend "s3" {
    bucket = "s3-demo-bucket-8790a"
    key="narendhar/teraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}