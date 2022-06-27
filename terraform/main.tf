resource "aws_vpc" "my_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = "${var.vpc_enable_dns}"

  tags = {
    Name = "My VPC"
  }
}

resource "aws_security_group" "sg" {
  name        = "allow_sg"
  description = "Allow SSH inbound connections"
  vpc_id = aws_vpc.my_vpc.id
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = local.egress_rules
    content {
         from_port   = egress.value.port
         to_port     = egress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "allow_ssh_sg"
  }
}

locals {
  ingress_rules= [
    {port=54
    description=" data for port 54"},
    {port=23
    description="data for port 23"}
  ]
  egress_rules=[
    {port=32
    description=" data for port 32"},
    {port=43
    description="data for port 43"}
  ]
}