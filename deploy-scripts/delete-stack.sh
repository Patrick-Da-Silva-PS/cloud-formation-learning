ENV_NAME=$1
BUCKET_URL=https://s3.amazonaws.com/recright-sandbox-cloudformation

STACK_NAME=$ENV_NAME-stack
TEMPLATE_URL=$BUCKET_URL/master.yaml

echo "Environment: ${ENV_NAME}"
echo "Stack name: ${STACK_NAME}"

echo "Deleting stack..."
aws cloudformation delete-stack --stack-name $STACK_NAME
echo "Done."

