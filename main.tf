terraform {
  backend "s3" {
    bucket         = "bayer-infra-state"    # Replace with your S3 bucket name
    key            = "prod/"         # Path to your state file in S3
    region         = "us-east-1"                      # Your AWS region
    encrypt        = true
    dynamodb_table = aws_dynamodb_table.terraform_state_lock.name  # Reference to the DynamoDB table
  }
}
