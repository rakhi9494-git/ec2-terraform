# jenkins-terraform
jenkins-terraform

Terraform installation:

sudo dnf update

sudo dnf install java-17-amazon-corretto -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo dnf install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

df -h /tmp

sudo mount -o remount,size=2G /tmp

vi /etc/fstab

tmpfs /tmp tmpfs defaults,size=2G 0 0 # Change 2G to your desired size



---------------------------------------------------

Terraform installation:

sudo wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip

apt install unzip

sudo unzip terraform_0.14.7_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform -v

---------------------------------------------------

Docker installation:

yum install docker -y

sudo systemctl enable docker

sudo systemctl start docker

Backend main.tf
-------------------


provider "aws" {
  region     = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0261755bbcb8c4a84"
  instance_type          = "t2.micro"
  key_name               = "test345"
  monitoring             = true
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "prod"
  }
}
terraform {
  backend "s3" {
    bucket         = "mykrybucket" # Replace with your S3 bucket name
    key            = "terraform.tfstate" # Key is the name of the state file in the bucket
    region         = "us-east-1" # Replace with your desired AWS region
    encrypt        = true
  }
}
