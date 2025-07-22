resource "aws_cloudwatch_event_rule" "daily_trigger" {
  name                = "daily-claim-ingest"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.daily_trigger.name
  target_id = "ingestClaimsTarget"
  arn       = aws_lambda_function.ingest_claims.arn
}