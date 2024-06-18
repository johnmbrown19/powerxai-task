provider "aws" {
  region = "eu-central-1"
}

resource "aws_lambda_function" "python_lambda" {
  function_name = "python_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main.handler"
  runtime       = "python3.8"
  source_code_hash = filebase64sha256("../my_python_service/function.zip")
  filename      = "../my_python_service/function.zip"

  environment {
    variables = {
      ENV = "dev"
    }
  }
}

resource "aws_lambda_function" "typescript_lambda" {
  function_name = "typescript_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_code_hash = filebase64sha256("../my_ts_service/function.zip")
  filename      = "../my_ts_service/function.zip"

  environment {
    variables = {
      ENV = "dev"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Sid    = "",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name   = "lambda_policy"
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Effect   = "Allow",
          Action   = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          Resource = "*"
        },
      ]
    })
  }
}
