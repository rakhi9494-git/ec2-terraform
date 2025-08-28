provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}


variable "instance_names" {
  description = "A set of unique names for the EC2 instances."
  type        = set(string)
  default     = ["web-server-01", "web-server-02"]
}


resource "aws_instance" "example" {
  for_each = var.instance_names

  ami           = "ami-0a0b0b06dd1636865"
  instance_type = "t3.micro"

  tags = {
    # The name is pulled directly from the set
    Name = each.key
  }
}

output "instance_public_ips" {
  description = "The public IP addresses of the created instances."
  value       = { for name, instance in aws_instance.example : name => instance.public_ip }
}
