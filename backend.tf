terraform {
  backend "s3" {
    bucket = "manu-iac-lab-tfstate"
    region = "us-east-1"
    key = "manu-iac-lab/dev/terraform.tfstate"
    dynamodb_table = "manu-iac-lab-tfstate-locks"
    encrypt = true
  }
}

