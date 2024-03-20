resource "aws_vpc" "my-vpc"{
  cidr_block        = var.vpc_cidr
  instance_tenancy  = var.tenancy
  tags = {
    Name = "${terraform.workspace}-my-vpc"
  }
}
