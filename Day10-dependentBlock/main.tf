provider "aws" {
  
}

resource "aws_s3_bucket" "buck"{

    bucket = "sarademobuck"
 

}

resource "aws_instance" "name" {
  ami = "ami-0d351f1b760a30161"
  instance_type = "t3.micro"
  key_name = "MyMumbaiKey"
  tags = {
    Name = "myec2"
  }
  
}