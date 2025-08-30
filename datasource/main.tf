provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}


resource "aws_instance" "app_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  tags = {
    Name = "My-App-Server"
  }
}
