ENV_NAME=$1
BUCKET_URL=https://s3.amazonaws.com/recright-sandbox-cloudformation
S3_BUCKET_URN=s3://recright-sandbox-cloudformation

STACK_NAME=$ENV_NAME-stack
TEMPLATE_URL=$BUCKET_URL/master.yaml
PARAMETERS="ParameterKey=EnvironmentName,ParameterValue=${ENV_NAME}"

echo "Environment: ${ENV_NAME}"
echo "Stack name: ${STACK_NAME}"
echo "Template URL: ${TEMPLATE_URL}"
echo "Parameters: ${PARAMETERS}"
echo "Moving infrastructure files to S3..."
aws s3 cp ./src $S3_BUCKET_URN --recursive
echo "Done."
echo "Updating stack..."
aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-url $TEMPLATE_URL \
    --parameters $PARAMETERS
echo "Done."