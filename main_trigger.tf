resource "aws_lambda_event_source_mapping" "event_source_mapping_a" {
  batch_size        = 1
  event_source_arn  = aws_sqs_queue.json-payload-a.arn
  enabled           = true
  function_name     = aws_lambda_function.lambda_receiver_a.arn
}

resource "aws_lambda_event_source_mapping" "event_source_mapping_b" {
  batch_size        = 1
  event_source_arn  = aws_sqs_queue.json-payload-b.arn
  enabled           = true
  function_name     = aws_lambda_function.lambda_receiver_b.arn
}