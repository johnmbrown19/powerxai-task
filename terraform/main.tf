provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_lambda_function" "python_lambda" {
  filename         = "${path.module}/my_python_service/function.zip"
  function_name    = "python_lambda_function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "main.handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("${path.module}/my_python_service/function.zip")
}

resource "aws_lambda_function" "typescript_lambda" {
  filename         = "${path.module}/my_ts_service/dist/function.zip"
  function_name    = "typescript_lambda_function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs18.x"  # Update to nodejs18.x or nodejs20.x
  source_code_hash = filebase64sha256("${path.module}/my_ts_service/dist/function.zip")
}
