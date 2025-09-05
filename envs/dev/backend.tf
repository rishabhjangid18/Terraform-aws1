terraform {
  backend "s3" {
    bucket         = "mycompany-tfstate"
    key            = "dev/networking/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
