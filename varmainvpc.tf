provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAXJQW2XIOVZJXCNM2"
  secret_key = "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"
}

 variable "subnet_cidr_block" {
     description = "subnet cidr block"
 }

 variable "vpc_cidr_block" {
     description = "vpc cidr block"
 }
  variable "environment" {
     description = "deployment enviroment"
  }
resource  "aws_vpc"  "development-vpc" {
   
   cidr_block = var.vpc_cidr_block.id

   tags = {
    Name = "var.environment"
    //vpc_env = "dev"
  }

}
resource "aws_subnet" "dev_sebnet-1" {

     vpc_id = aws_vpc.development-vpc.id
     cidr_block = var.subnet_cidr_block
     availability_zone = "ap-south-1a"

     tags = {
    Name = "dev-subnet-1"
  }
  
}
data "aws_vpc" "existing_vpc" {
    default = true
}
resource "aws_subnet" "dev_sebnet-2" {

     vpc_id = data.aws_vpc.existing_vpc.id
     cidr_block = "172.31.48.0/20"
     availability_zone = "ap-south-1a"

     tags = {
    Name = "dev-subnet-2"
  }
  
}
   output "dev-vpc-id" {

       value = aws_subnet.dev_sebnet-2.id 
   }

   output "dev-vpc-id" {

       value = aws_subnet.dev_sebnet-1 
   }