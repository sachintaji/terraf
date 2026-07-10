provider "aws" {
}



module "ec2mod"{
    source ="./modules/ec2"
    ami = "ami-0d351f1b760a30161"
    inst ="t3.micro"
    kn = "MyMumbaiKey"  
}