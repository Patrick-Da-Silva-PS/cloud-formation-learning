: "This script is used to create the main CloudFormation stack of the project, of which all other CloudFormation stacks are children.

Arguments: 
- ENV_NAME
    Determines the name used for the deployed environment.
"

# Script arguments
ENV_NAME=$1

# External URLs
BUCKET_URL=https://s3.amazonaws.com/recright-sandbox-cloudformation
S3_BUCKET_URN=s3://recright-sandbox-cloudformation

# Define parameters for the CloudFormation master.yaml template
parameter () {
    # The function call 
    # parameter my_variable A B
    # makes it so that the variable my_variable takes the value
    # "ParameterKey=A,ParameterValue=B"
    local ref=$1
    eval "${ref}=ParameterKey=$2,ParameterValue=$3"
}

parameter ENV_NAME_PARAM EnvironmentName $ENV_NAME
PARAMETERS=$ENV_NAME_PARAM

# Define CloudFormation master.yaml stack name
STACK_NAME=$ENV_NAME-stack

# Define URL where the master.yaml template will be located
TEMPLATE_URL=$BUCKET_URL/master.yaml

echo "\nVariables\n=========="
echo "Environment: $ENV_NAME"
echo "Stack name: $STACK_NAME"
echo "Template URL: $TEMPLATE_URL"
echo "Parameters: $PARAMETERS"
echo "\nProcess\n======="
echo "Moving infrastructure files to S3..."
aws s3 cp ./src $S3_BUCKET_URN --recursive
echo "Done."
echo "Updating stack..."
aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-url $TEMPLATE_URL \
    --parameters $PARAMETERS
echo "Done."