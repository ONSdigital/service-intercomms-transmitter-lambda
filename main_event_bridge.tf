resource "aws_cloudwatch_event_rule" "json-payload-event-A" {
	name = "intercomms-json-payload-event"
	description = "Put JSON payload from Lambda on SQS queue"
	event_pattern = <<-PATTERN
				{
				"source": [
					"transmitter_lambda"
				],
				"detail": {
					"destination": [
					"A"
					]
				}
				}
		PATTERN

// NEED TAGS

}

resource "aws_cloudwatch_event_rule" "json-payload-event-B" {
	name = "intercomms-json-payload-event-b"
	description = "Put JSON payload from Lambda on SQS queue"
	event_pattern = <<-PATTERN
				{
				"source": [
					"transmitter_lambda"
				],
				"detail": {
					"destination": [
					"B"
					]
				}
				}
		PATTERN

// NEED TAGS

}

resource "aws_cloudwatch_event_target" "json-payload-event-a" {
    rule = aws_cloudwatch_event_rule.json-payload-event-A.name
    arn  = aws_sqs_queue.json-payload-a.arn
}

resource "aws_cloudwatch_event_target" "pckjson-payload-event-b" {
    rule = aws_cloudwatch_event_rule.json-payload-event-B.name
    arn  = aws_sqs_queue.json-payload-b.arn
}