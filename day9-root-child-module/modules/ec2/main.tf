provider "aws" {
  
}


resource "aws_instance" "ec"{
    ami =var.ami
    instance_type = var.inst
    key_name = var.kn
}