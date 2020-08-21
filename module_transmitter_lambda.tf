module "transmitter-lambda" {
  source = "github.com/ONSdigital/service-intercomms-transmitter-lambda"

  vpc_config = {
    subnet_ids = ["XXXXXXXXXX", "XXXXXXXXXX"]
    security_group_ids = ["XXXXXXXXX"]
  }
//  source = "takeon"
}