### Description

An example project utilising this module: https://github.com/vishbhalla/terraform-aws-codebuild-deploy-tf

### Pre-Requisites

Terraform 0.12.x

### Deployment

`terraform init -input=false --backend-config=<path>/<backend_conf_filename>.conf`

`terraform apply -var-file=<path>/<vars_filename>.tfvars`

`terraform destroy -var-file=<path>/<vars_filename>.tfvars`

