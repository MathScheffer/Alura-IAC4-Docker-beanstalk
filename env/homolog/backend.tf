terraform {
  backend "s3" {
    bucket = "terraform-backend-curso-alura"
    key    = "homolog/terraform.tfstate"
    region = "us-east-1"
  }
}
