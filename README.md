[![Main](https://github.com/localgod/terraform_azure_experiments/actions/workflows/main.yml/badge.svg)](https://github.com/localgod/terraform_azure_experiments/actions/workflows/main.yml)

# Terraform Azure Experiments

## Set workspace to prod

```bash
$ terraform workspace select prod
```

## Set workspace to dev

```bash
$ terraform workspace select dev
```

## Add new function app

```bash
func init example --dotnet
```

## Add new function to the example app

```bash
cd ./example
func new --name hello-world --template "HTTP trigger" --authlevel "anonymous"
```

## Publish app

```bash
cd ./example
func azure functionapp publish function-app-e3bf2njz1skn2aeqr0va # function-app-e3bf2njz1skn2aeqr0va is the app name
```

## Example

```bash
curl -v http://function-app-e3bf2njz1skn2aeqr0va.azurewebsites.net/api/hello_world?name=Terraform
```