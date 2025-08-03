output "raw_bucket_name" {
  value = aws_s3_bucket.raw_data.bucket
}

output "processed_bucket_name" {
  value = aws_s3_bucket.processed_data.bucket
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
