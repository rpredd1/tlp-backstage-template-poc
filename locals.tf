locals {
  v1 = {
    "tlp-backstage-template-poc-helloWorld" = {
      type        = "function"
      handler     = "index.handler"
      runtime     = var.node_runtime
      source_path = "./dist/v1/tlp-backstage-template-poc"
      layers      = []
      description = "tlp-backstage-template-poc-helloWorld Lambda Function"
      events = {
        http_event_get = {
          type = "HttpApi"
          properties = {
            api_path   = "/v1/helloWorld"
            api_method = "GET"
            auth = {
              authorizer = "tlp-backstage-template-poc-authorizer"
            }
          }
        },
      }
    }
  }
  authorizers = {
    "tlp-backstage-template-poc-authorizer" = {
      type        = "authorizer"
      handler     = "index.handler"
      runtime     = var.node_runtime
      source_path = "./dist/v1/authorizer"
      description = "my lambda authorizer"
      environment = {
        ENV_VAR_1 = "value1"
        ENV_VAR_2 = "value2"
      }
    }
  }
}


