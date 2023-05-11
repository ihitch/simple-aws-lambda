REGION=
LAMBDA_NAME=test-lambda
AWS_ACCOUNT_ID=
ROLE_NAME=
deploy:
	zip function.zip lambda_function.py
	aws lambda create-function --function-name ${LAMBDA_NAME} \
		--zip-file fileb://function.zip \
		--runtime python3.8 \
		--handler lambda_function.lambda_handler \
		--role arn:aws:iam::${AWS_ACCOUNT_ID}:role/${ROLE_NAME} \
		--region ${REGION} \
		--no-cli-pager

invoke:
	aws lambda invoke --function-name ${LAMBDA_NAME} output.txt --region ${REGION} --no-cli-pager
	cat output.txt

delete:
	aws lambda delete-function --function-name ${LAMBDA_NAME} --region ${REGION}