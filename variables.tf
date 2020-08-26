variable "vpc_config" {
  default     = null
  description = "Provide this to allow your function to access your VPC"
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}

variable "region" {
  default = "eu-west-2"
}