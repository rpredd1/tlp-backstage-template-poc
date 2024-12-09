#!/bin/bash
npm run build:local

cleanup() {
  ESBUILD_PID=$(ps aux | grep '[e]sbuild' | awk '{print $2}')
  kill $ESBUILD_PID
  echo "Killing node process esbuild PID: $ESBUILD_PID"

  # Remove template.json
  rm -f template.json
  echo "Cleaned up template.json"
}

trap cleanup SIGINT SIGTERM

# Generate outputs without deploying resources
rm -f terraform.tfstate terraform.tfstate.backup
terraform apply -target=null_resource.generate_outputs -target=output.sam_template -auto-approve -var-file=environments/local.tfvars

if [ $? -ne 0 ]; then
  echo "Terraform apply failed"
  exit 1  # Exit with an error code
fi

# Export Terraform outputs to JSON
terraform output -json sam_template > template.json
sam local start-api -t template.json --warm-containers EAGER
