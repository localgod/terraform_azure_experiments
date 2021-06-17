ORG=mathmagicians
.PHONY: setup init login setup_prod_workspace setup_dev_workspace
setup:
	@./dev_setup.sh
init:
	@cd ./terraform && terraform init -backend-config="token=${TF_API_TOKEN}" && cd ..
login:
	@az login --service-principal -u ${TF_VAR_CLIENT_ID} -p ${TF_VAR_CLIENT_SECRET} --tenant ${TF_VAR_TENANT_ID}
setup_prod_workspace:
	@tfh pushvars -var resource_group_location=northeurope                   -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -var uuid=e3bf2njz1skn2aeqr0av                             -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -var environment=prod                                      -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -senv-var TF_VAR_TENANT_ID=${TF_VAR_TENANT_ID}             -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -senv-var TF_VAR_SUBSCRIPTION_ID=${TF_VAR_SUBSCRIPTION_ID} -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -senv-var TF_VAR_CLIENT_ID=${TF_VAR_CLIENT_ID}             -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
	@tfh pushvars -senv-var TF_VAR_CLIENT_SECRET=${TF_VAR_CLIENT_SECRET}     -token ${TF_API_TOKEN} -org ${ORG} -name tae-prod
setup_dev_workspace:
	@tfh pushvars -var resource_group_location=northeurope                   -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -var uuid=e3bf2njz1skn2aeqrdev                             -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -var environment=dev                                       -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -senv-var TF_VAR_TENANT_ID=${TF_VAR_TENANT_ID}             -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -senv-var TF_VAR_SUBSCRIPTION_ID=${TF_VAR_SUBSCRIPTION_ID} -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -senv-var TF_VAR_CLIENT_ID=${TF_VAR_CLIENT_ID}             -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev
	@tfh pushvars -senv-var TF_VAR_CLIENT_SECRET=${TF_VAR_CLIENT_SECRET}     -token ${TF_API_TOKEN} -org ${ORG} -name tae-dev