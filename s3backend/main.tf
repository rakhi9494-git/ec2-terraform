provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0a0b0b06dd1636865"
  key_name = "rajdevops"
  tags = {
    Name = "My-Terraform-EC2-Instance"
  }
}

terraform {
  backend "s3" {
    bucket         = "rakesh-terraform-practice" # Replace with your S3 bucket name
    key            = "terraform.tfstate" # Key is the name of the state file in the bucket
    region         = "ap-southeast-2" # Replace with your desired AWS region
    encrypt        = true
  }
}
