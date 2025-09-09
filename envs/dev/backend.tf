terraform {
  backend "s3" {
    bucket         = "terraform-test-cicd-8099"
    key            = "dev/networking/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
