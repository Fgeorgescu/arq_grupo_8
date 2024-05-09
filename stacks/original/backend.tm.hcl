generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket = "infrastructure-stacks"
        key    = "tpo/original"
        region = "us-east-1"
      }
    }
  }
}