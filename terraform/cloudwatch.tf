# CloudWatch Events rule to trigger the Lambda hourly
resource "aws_cloudwatch_event_rule" "hourly_trigger" {
  name                = "hourly-trigger"
  description         = "Trigger Lambda function hourly"
  schedule_expression = "cron(0 * * * ? *)"  # Run every hour
}

# CloudWatch Events rule and Lambda function association
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.hourly_trigger.name
  target_id = "data-ingestion-target"
  arn = aws_lambda_function.data_ingestion_lambda.arn
}