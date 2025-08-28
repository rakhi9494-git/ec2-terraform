# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Creates a new EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0b0b8c62c95c862d6"
  instance_type = "t2.micro"

  tags = {
    Name = "Web-Server"
  }

  # Provisioner to execute on the local machine
  provisioner "local-exec" {
    command = "echo 'Web server IP: ${self.public_ip}' >> inventory.txt"
  }

  # Connection block for remote access
  connection {
    type        = "ssh"
    user        = "ubuntu" # Use "ec2-user" for Amazon Linux AMIs
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  # Provisioner to copy a file from local to remote
  provisioner "file" {
    source      = "setup.sh"
    destination = "/tmp/setup.sh"
  }

  # Provisioner to run a command on the remote server
  # It executes the script we just copied
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "sudo /tmp/setup.sh"
    ]
  }
}

# Output the instance's public IP
output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
