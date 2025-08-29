provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

module "dev_app_server" {
  source = "./modules/app_server"

  ami           = "ami-0a0b0b06dd1636865"
  instance_type = "t3.micro"
  key_name = "rajdevops"
  server_name   = "dev-web-app"
}

module "prod_app_server" {
  source = "./modules/app_server"

  ami           = "ami-0a0b0b06dd1636865"
  instance_type = "t3.micro"
  key_name = "rajdevops"
  server_name   = "prod-web-app"
}

output "dev_instance_id" {
  value = module.dev_app_server.instance_id
}
