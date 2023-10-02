# Lambda function for data ingestion
resource "aws_lambda_function" "data_ingestion_lambda" {
  function_name    = "data-ingestion-lambda"
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "python3.8"
  filename        = "lambda.zip"  # path to Lambda deployment package
  source_code_hash = filebase64("lambda.zip")
  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.data_lake.bucket
    }
  }
}

# IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# IAM role Attachment policy to allow S3 read access
resource "aws_iam_policy_attachment" "lambda_s3_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  roles       = [aws_iam_role.lambda_role.name]
  name = "lambda-role-policy"
}

