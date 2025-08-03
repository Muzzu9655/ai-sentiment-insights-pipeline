terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

# 1️⃣ S3 Bucket for Raw Data
resource "aws_s3_bucket" "raw_data" {
  bucket = "${var.project_name}-raw-data"
}

# 2️⃣ S3 Bucket for Processed Data
resource "aws_s3_bucket" "processed_data" {
  bucket = "${var.project_name}-processed-data"
}

# 3️⃣ IAM Role for Lambda (Minimal Example)
resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# Optional: Lambda Function Placeholder (Not deployed to save cost)
# resource "aws_lambda_function" "etl_lambda" {
#   filename         = "etl.zip"
#   function_name    = "${var.project_name}-etl"
#   role             = aws_iam_role.lambda_role.arn
#   handler          = "lambda_function.lambda_handler"
#   runtime          = "python3.9"
# }
