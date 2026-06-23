terraform {
  backend "s3" {
    bucket = "demobucksa"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = "true"
    encrypt = true
  }
}
