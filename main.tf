provider "aws" {
  region     = "ap-south-1"
  
}
variable "cidr_blocks" {
  description = "cidr blocks for vpcs and subnets"
  type = list(object({
       cidr_block = string
       name = string
  }))
}
resource "aws_vpc" "development_vpc"{
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name : var.cidr_blocks[0].name
 }
}
resource "aws_subnet" "dev_sub_1"{
  vpc_id = aws_vpc.development_vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = "ap-south-1a"
  tags = {
    Name: var.cidr_blocks[0].name
  }
}
