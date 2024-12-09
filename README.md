# Serverless Typescript Template (Terraform)

This project, named `tlp-backstage-template-poc`, is a template for creating AWS Lambda functions using TypeScript. It provides a structured and standardized way to build, test, and deploy your serverless applications.

## Description

The `tlp-backstage-template-poc` is a project template that includes a set of npm scripts for common tasks such as building, testing, and deploying your application.


## Table of Contents

- [Serverless Typescript Template (Terraform)](#serverless-typescript-template-terraform)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Testing](#testing)
  - [Linting and Formatting](#linting-and-formatting)
  - [Versioning](#versioning)
  - [Secrets Management](#secrets-management)
  - [AWS Setup](#aws-setup)
  - [Deployment](#deployment)
    - [GitLab](#gitlab)
    - [Test and Learn Account](#test-and-learn-account)
  - [Contributing](#contributing)


<!-- ## TODO
- Setup README
- Example RDS/DynamoDB configuration
- SAM terraform hook
- Sonarqube/Artifactory OIDC
- Dev workflow (preview deployment before merging to NP)
- Backstage integration
- Strict typing of terraform modules
- ESLINT Configuration
 -->

## Prerequisites

- Node.js
- npm
- AWS CLI
- Terraform

## Getting Started

1. Clone the repository.
2. Create the file backend_override.tf in the root folder and add the following
```tf
  terraform {  
    backend "local" {   
      path = "terraform.tfstate"  
    }
  }
```
3. Install dependencies: `npm install`
4. Configure your AWS credentials.
5. Set up environment variables.

### Runnig Locally
6. run terraform init -var-file=environments/local.tfvars
7. run npm run start

## Testing

Testing is done using `jest`. To run tests, use `npm run test`.

## Linting and Formatting

This project uses `eslint` and `prettier` for linting and formatting. To lint the code, use `npm run lint`. To format the code, use `npm run format`.

## Versioning

This project follows semantic versioning.

## Secrets Management

Secrets are managed using AWS Secrets Manager and Terraform.

## AWS Setup

Ensure you have the necessary AWS permissions and have configured your AWS CLI.


## Deployment
For more information on how to deploy the Terraform code, please visit [this link](https://example.com/terraform-deployment-guide).

### GitLab

For GitLab, simply create a Merge Request (MR) and the deployment will be handled automatically by the pipelines. (Working in progress)

### Test and Learn Account
For the Test and Learn account, the deployment process is more complex. (Working in progress)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.