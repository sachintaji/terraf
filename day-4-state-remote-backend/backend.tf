resource "aws_instance" "name" {
    ami = "ami-0e38835daf6b8a2b9"
    instance_type = "t3.micro"
    key_name = "MyMumbaiKey"  
    tags = {
        Name = "devops"
    } 
  
}

