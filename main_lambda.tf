 # Cloud watch
resource aws_cloudwatch_log_group transmitter_lambda {
  name              = format("/aws/lambda/%s", aws_lambda_function.transmitter_lambda.function_name)
  retention_in_days = 1

//NEED TO DO TAGS

}

resource "aws_iam_role" "lambda" {
  name = "intercomms_lambda_role"
  assume_role_policy = file("${path.module}/json_policies/lambda_policy.json")

//NEED TO DO TAGS

}

resource "aws_iam_role_policy_attachment" "lambda-execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda.name
}

resource "aws_iam_role_policy_attachment" "lambda-execution-fullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  role       = aws_iam_role.lambda.name
}

resource "aws_iam_role_policy_attachment" "lambda-ec2-fullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCCrossAccountNetworkInterfaceOperations"
  role       = aws_iam_role.lambda.name
}

 resource "aws_iam_role_policy_attachment" "SQSQueue-ExecutionRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
  role       = aws_iam_role.lambda.name
}

 //Lambda - Transmitter

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "${path.module}/handler.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "transmitter_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "transmitter_lambda"
  role             = aws_iam_role.lambda.arn
  handler          = "handler.lambda_handler"
  source_code_hash = "data.archive_file.lambda_zip.output_base64sha256"
  runtime          = "python3.8"

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

//NEED TO DO TAGS

}

 // Lambda - Reciever

 data "archive_file" "lambda_receiver" {
  type        = "zip"
  source_file = "${path.module}/lambda_receiver.py"
  output_path = "lambda_receiver.zip"
}

resource "aws_lambda_function" "lambda_receiver_a" {
  function_name = "lambda_receiver_a"
  handler = "lambda_receiver.handler"
  role = aws_iam_role.lambda.arn
  runtime = "python3.8"

  filename = "lambda_receiver.zip"
  source_code_hash = "data.archive_file.lambda_receiver.output_base64sha256"

  memory_size = 128

   dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

// NEED TAGS
}

resource "aws_lambda_function" "lambda_receiver_b" {
  function_name = "lambda_receiver_b"
  handler = "lambda_receiver.handler"
  role = aws_iam_role.lambda.arn
  runtime = "python3.8"

  filename = "lambda_receiver.zip"
  source_code_hash = "data.archive_file.lambda_receiver.output_base64sha256"

  memory_size = 128

   dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

// NEED TAGS
}
