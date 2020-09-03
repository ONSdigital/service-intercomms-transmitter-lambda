resource "aws_sqs_queue" "json-payload-a" {
  name = "intercomms-json-payload"
  //redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq.arn}\",\"maxReceiveCount\":3}"

  // NEED TAGS
}

resource "aws_sqs_queue" "json-payload-b" {
  name = "intercomms-json-payload-b"
  //redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq.arn}\",\"maxReceiveCount\":3}"

  // NEED TAGS
}