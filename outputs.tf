output "arn" {
  description = "Lambda ARN"
  value       = aws_lambda_function.transmitter_lambda.arn
}

output "name" {
  description = "Lambda Name"
  value       = aws_lambda_function.transmitter_lambda.function_name
}

output "cloudwatch_logs_name" {
  description = "The name of the log group."
  value       = aws_cloudwatch_log_group.this.name
}