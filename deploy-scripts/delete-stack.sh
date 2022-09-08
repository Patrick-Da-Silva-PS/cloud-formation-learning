: "This script is used to destroy the main CloudFormation stack of the project, of which all other CloudFormation stacks are children.

Arguments: 
- ENV_NAME
    Determines the name used for the deployed environment.
"

# Script arguments
ENV_NAME=$1

# External URLs
BUCKET_URL=https://s3.amazonaws.com/recright-sandbox-cloudformation

# Define CloudFormation master.yaml stack name
STACK_NAME=$ENV_NAME-stack

# Define URL where the master.yaml template will be located
TEMPLATE_URL=$BUCKET_URL/master.yaml

echo "\nVariables\n=========="
echo "Environment: ${ENV_NAME}"
echo "Stack name: ${STACK_NAME}"

echo "\nProcess\n======="
echo "Deleting stack..."
aws cloudformation delete-stack --stack-name $STACK_NAME
echo "Done."

