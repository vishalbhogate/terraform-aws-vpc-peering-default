
provider "aws" {
  alias  = "peer"
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::975816917933:role/ci-deploy-terraform"
  }
}

