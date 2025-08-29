# This is the code inside the module
resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_size
  tags = {
    Name = var.server_name
  }
}
