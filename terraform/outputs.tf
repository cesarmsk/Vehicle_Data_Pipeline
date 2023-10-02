# Output the Lambda function ARN for use in CloudWatch Events
output "lambda_function_arn" {
  value = aws_lambda_function.data_ingestion_lambda.arn
}

output "DB_NAME" {
  value = var.DB_NAME
}

output "USER_NAME" {
  value = var.USER_NAME
}

output "PASSWORD" {
  value = var.PASSWORD
}

