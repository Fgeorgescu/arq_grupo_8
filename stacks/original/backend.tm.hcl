generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket = "infrastructure-stacks-2"
        key    = "tpo/original"
        region = "us-east-1"
      }
    }
  }
}