provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

variable "ec2_instances" {
  description = "A map of EC2 instance configurations."
  type        = map(any)
  default = {
    web_server = {
      instance_type = "t3.micro"
      ami           = "ami-0279a86684f669718"
    }
    app_server = {
      instance_type = "t3.micro"
      ami           = "ami-02010f4ba46655bb2"
    }
  }
}

resource "aws_instance" "example" {
  for_each = var.ec2_instances

  # The instance attributes are pulled from the map's values
  instance_type = each.value.instance_type
  ami           = each.value.ami

  tags = {
    # The instance name comes from the map's key
    Name = "My-Server-${each.key}"
  }
}


output "instance_public_ips" {
  description = "The public IP addresses of the created instances."
  value       = { for name, instance in aws_instance.example : name => instance.public_ip }
}
