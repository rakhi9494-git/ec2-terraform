variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
