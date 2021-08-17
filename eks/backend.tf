data "aws_caller_identity" "aws" {
  provider = aws
}

terraform {
  backend "s3" {
    # bucket         = "bucket-for-tfstate"
    # key            = "eks.tfstate"
    # region         = "eu-central-1"
    # profile        = "profile_name"
    # dynamodb_table = "terraform-state-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  # region = "eu-central-1"
}
