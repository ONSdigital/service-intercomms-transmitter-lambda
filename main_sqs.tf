resource "aws_sqs_queue" "json-payload" {
  name = "intercomms-json-payload"
  //redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq.arn}\",\"maxReceiveCount\":3}"

  // NEED TAGS
}