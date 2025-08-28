provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}


variable "instance_count" {
  description = "The number of EC2 instances to create."
  type        = number
  default     = 2 # This will create two instances
}

# Create EC2 instances using the count meta-argument
resource "aws_instance" "example" {

  count = var.instance_count 
  ami           = "ami-0a0b0b06dd1636865"
  key_name = "rajdevops"
  

  instance_type = "t3.micro"


  tags = {
    Name = "My-EC2-Instance-${count.index}"
  }
}

output "instance_public_ips" {
  description = "The public IP addresses of the created instances."
  value       = aws_instance.example[*].public_ip
}
