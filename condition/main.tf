provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

variable "create_instance" {
  type    = bool
  default = true
}

resource "aws_instance" "example" {
  count         = var.create_instance ? 1 : 0
  ami           = "ami-0a0b0b06dd1636865"
  instance_type = "t3.micro"
  tags = {
    Name = "My-Conditional-Instance"
  }
}
