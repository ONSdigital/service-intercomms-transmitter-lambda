resource "aws_cloudwatch_event_rule" "console" {
  name        = "schedule_transmitter"
  description = "Scheduled events to trigger the transmitter lambda"
  is_enabled = "false"
  schedule_expression = "rate(2 minutes)"
}
resource "aws_cloudwatch_event_target" "transmitter_lambda" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "transmitter_lambda"
  arn       = aws_lambda_function.transmitter_lambda.arn
  input = <<JSON
{
  "transmitt4er": "terraformed-scheduler"
}
JSON
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_foo" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "transmitter_lambda"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.console.arn
}