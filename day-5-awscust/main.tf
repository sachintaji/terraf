#creating custom vpc
resource "aws_vpc" "cust_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "cust_vpc"

  }
}


#creating subnet 
resource "aws_subnet" "sub"{
    vpc_id = aws_vpc.cust_vpc.id
    cidr_block ="10.0.0.0/25"
    tags = {
        Name = "cust_sub"
    }

}

#creating internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.cust_vpc.id
    tags = {
        Name = "cust_igw"
    }
}


#creating route table and editing routes
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.cust_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

#creating route table association
resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.sub.id
    route_table_id = aws_route_table.rt.id
}       


#creation of custom  security group 
resource "aws_security_group" "sg" {
    name = "cust_sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_vpc.cust_vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}   

# creation of custom ec2 instance 

resource "aws_instance" "test"{
    ami = "ami-0d351f1b760a30161"
    instance_type ="t3.micro"
    key_name = "MyMumbaiKey"
    subnet_id = aws_subnet.sub.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = {
        Name = "cust_ec2"
    }
}