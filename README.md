# service-intercomms-transmitter-lambda
Lambda that transmits JSON payload to an AWS SQS Queue

How to use:

Place this within your main.tf config:-

module "transmitter-lambda" {
  source = "github.com/ONSdigital/service-intercomms-transmitter-lambda"

  vpc_config = {
    subnet_ids = ["XXXXXXXXXX", "XXXXXXXXXX"]
    security_group_ids = ["XXXXXXXXX"]
  }
//  NEED TAGGING
}

This will then pull down the repo at 'terraform init' stage and use the resources within the git repo.