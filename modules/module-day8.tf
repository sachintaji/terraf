module "name" {
  source   = "../day-2"
  ami_id = "ami-0e38835daf6b8a2b9"
  type = "t3.micro"
  key_name = "MyMumbaiKey"   

}