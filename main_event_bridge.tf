resource "aws_cloudwatch_event_rule" "json-payload-event" {
	name = "intercomms-json-payload-event"
	description = "Put JSON payload from Lambda on SQS queue"
	event_pattern = <<-PATTERN
				{
				"source": [
					"transmitter_lambda"
				]
				}
		PATTERN

// NEED TAGS

}

resource "aws_cloudwatch_event_target" "pckjson-payload-event" {
    rule = aws_cloudwatch_event_rule.json-payload-event.name
    arn  = aws_sqs_queue.json-payload.arn
}