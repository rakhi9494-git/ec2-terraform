provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-084a7d336e816906b" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"
  key_name      = "terraform" # Reference the key pair created above

  tags = {
    Name = "MyTerraformEC2Instance"
  }
}
