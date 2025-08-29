provider "aws" {
  region = "ap-southeast-2" # Or your desired region
}

resource "aws_iam_role" "my_ec2_role" {
  name = "my-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "my_ec2_policy" {
  role       = aws_iam_role.my_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0a0b0b06dd1636865"
  key_name = "rajdevops"
  instance_type = "t3.micro"
  
  # This is where depends_on is used.
  # Terraform will not create this instance until the `aws_iam_role_policy_attachment`
  # resource is fully created and the policy is attached.
  depends_on = [
    aws_iam_role_policy_attachment.my_ec2_policy
  ]
}
