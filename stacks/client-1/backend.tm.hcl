generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket = "infrastructure-stacks"
        key    = "tpo/client-1"
        region = "us-east-1"
      }
    }
  }
}