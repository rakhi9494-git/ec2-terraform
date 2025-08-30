# main.tf
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0a0b0b06dd1636865"
  instance_type = var.instance_type
  tags = {
    Name = "app-server-${terraform.workspace}"
  }
}
