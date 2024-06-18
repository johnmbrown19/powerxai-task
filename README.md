# PowerXAI

This repository contains two serverless functions: one written in Python and one in TypeScript.

## Project Structure

- `my_python_service`: Contains the Python service.
- `my_ts_service`: Contains the TypeScript service.
- `.github/workflows`: Contains CI/CD workflows for GitHub Actions.
- `terraform`: Contains Terraform scripts for infrastructure as code.

## Setup and Testing

### Prerequisites

- Docker
- AWS SAM CLI
- Node.js
- Python 3.9

### Building and Testing Locally

#### Python Service

cd my_python_service
sam build -t ../python-template.yaml
sam local invoke PythonFunction -t ../python-template.yaml --event ../event.json

#### Typescript Service

cd my_ts_service
npm install
npm run build
sam build -t ../typescript-template.yaml
sam local invoke TypeScriptFunction -t ../typescript-template.yaml --event ../event.json

### Deployment
Follow the steps in the Terraform directory to deploy the services to AWS.

### CI/CD
GitHub Actions workflows are set up to automate the build, test, and deployment process for both services.

### Contact
For any questions or issues, please contact johnmcleodbrown@gmail.com.
