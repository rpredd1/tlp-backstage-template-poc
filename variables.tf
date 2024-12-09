variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "node_runtime" {
  description = "Node runtime"
  type        = string
  default     = "nodejs20.x"
}

variable "domain_name" {
  description = "Custom domain name"
  type        = string
  default     = ""
}

variable "path" {
  description = "API base domain name"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "role" {
  description = "Deploy role"
  type        = string
}

variable "dd_api_key_secret_arn" {
  type = string
  default = ""
}

variable "environment"{
  description = "the environment where the lambda is running"
  type        = string
  default     = "np"
}
