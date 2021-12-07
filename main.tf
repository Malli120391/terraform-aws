provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAXJQW2XIOVZJXCNM2"
  secret_key = "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"
}

resource  "aws_vpc"  "development-vpc" {
   
   cidr_block = "10.0.0.0/16"

   tags = {
    Name = "devlop-vpc"
    vpc_env = "dev"
  }

}

resource "aws_subnet" "dev_sebnet-1" {

     vpc_id = aws_vpc.development-vpc.id
     cidr_block = "10.0.10.0/24"
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