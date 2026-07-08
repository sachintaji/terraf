output "az" {
  value = aws_instance.name.availability_zone
}                   

output "pub_ip" {
  value = aws_instance.name.public_ip
}

output  "private_ip"{
    value = aws_instance.name.private_ip
    sensitive = true
}