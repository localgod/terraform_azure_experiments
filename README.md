[![Main](https://github.com/localgod/terraform_azure_experiments/actions/workflows/main.yml/badge.svg)](https://github.com/localgod/terraform_azure_experiments/actions/workflows/main.yml)

# Terraform Azure Experiments

# Add new function app

```bash
func init example --dotnet
```

# Add new function to the example app

```bash
cd ./example
func new --name hello-world --template "HTTP trigger" --authlevel "anonymous"
```