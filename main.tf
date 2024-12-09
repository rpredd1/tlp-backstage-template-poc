terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
  backend "s3" {}
  required_version = "~> 1.5.5"
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.role
  }
}

module "lambda" {
  source              = "git::https://github.com/bayer-int/tlp-terraform-modules//modules/lambda"
  lambda_functions    = merge(local.v1, local.authorizers)
  security_group_name = var.security_group_name
  vpc_name            = var.vpc_name
  api_gw_execution_arn = module.gw.api_execution_arn
  dd_api_key_secret_arn = var.dd_api_key_secret_arn
  environment = var.environment
}


module "gw" {
  source      = "git::https://github.com/bayer-int/tlp-terraform-modules//modules/apigateway_v2"
  name        = "tlp-backstage-template-poc"
  description = "tlp-backstage-template-poc API Gateway"

  domain_name = var.domain_name
  base_path   = var.path
  cors_configuration = {
    allow_headers = [
      "Content-Type",
      "X-Amz-Date",
      "X-Api-Key",
      "X-Amz-Security-Token",
      "X-Amz-User-Agent",
      "Authorization",
      "AuthorizationProvider"
    ]
    allow_origins = ["*"]
    allow_methods = ["*"]
  }

  lambda_functions     = merge(local.v1, local.authorizers)
  lambda_function_arns = module.lambda.lambda_function_arns
  payload_format_version = "1.0"
  authorizer_payload_format_version = "1.0"
}

# Null resource to trigger output generation for local testing
resource "null_resource" "generate_outputs" {
  triggers = {
    always_run = timestamp()
  }
}

# Output SAM templates for local development
output "sam_template" {
  value = {
    Transform = "AWS::Serverless-2016-10-31",
    Resources = merge(
      module.lambda.lambda_sam_template.Resources,
      module.gw.api_gateway_sam_template.Resources
    )
  }
  depends_on = [null_resource.generate_outputs]
}

