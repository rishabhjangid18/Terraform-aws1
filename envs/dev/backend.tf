terraform {
  backend "s3" {
    bucket         = "terraform-cicd-8099"
    key            = "dev/networking/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
