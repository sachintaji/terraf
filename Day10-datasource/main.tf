provider "aws" {

}


data "aws_subnet" "sub" {
  filter {
    name   = "tag:Name"
    values = ["subnet-1"]

  }
}

resource "aws_instance" "ec" {

  ami           = "ami-0d351f1b760a30161"
  instance_type = "t3.micro"
  key_name      = "MyMumbaiKey"

  tags = {
    Name = "sachin"
  }

  subnet_id = data.aws_subnet.sub.id

}
