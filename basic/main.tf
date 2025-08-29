provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0a0b0b06dd1636865"
  instance_type = "t3.micro"
  key_name = "rajdevops"

  tags = {
    Name = "MyTerraformEC2Instance"
  }
}
