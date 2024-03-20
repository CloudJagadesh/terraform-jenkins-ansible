provider "aws"{
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "mybucket-tf"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}
