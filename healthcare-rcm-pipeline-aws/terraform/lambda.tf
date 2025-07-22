resource "aws_lambda_function" "ingest_claims" {
  function_name = "ingest_claims"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "ingest_claims.lambda_handler"
  runtime       = "python3.9"
  timeout       = 60
  filename      = "../dist/ingest_claims.zip"
  environment {
    variables = {
      SFTP_SECRET_NAME = aws_secretsmanager_secret.sftp_password.name
    }
  }
}

resource "aws_lambda_function" "transform_rcm" {
  function_name = "transform_rcm"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "transform_rcm.lambda_handler"
  runtime       = "python3.9"
  timeout       = 60
  filename      = "../dist/transform_rcm.zip"
}