terraform {
  required_version = ">= 0.12"
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

data "terraform_remote_state" "state" {
  backend = "s3"

  config = {
    bucket  = var.terraform_state["bucket"]
    region  = var.region
    key     = var.terraform_state["key"]
    encrypt = true
  }
}

module "codebuild_tf_lambda_deploy" {
  source = "git::https://github.com/vishbhalla/terraform-aws-codebuild-lambda.git"

  region = var.region
  name = var.name
  namespace = var.namespace
  stage = var.stage
  tags = var.tags
  codebuild_project_description = var.codebuild_project_description
  github_owner = var.github_owner
  github_repo = var.github_repo
  codebuild_iam_policy_arns = var.codebuild_iam_policy_arns
  codepipeline_iam_policy_arns = var.codepipeline_iam_policy_arns
  codebuild_env_vars = var.codebuild_env_vars
  ssm_param_name_github_token = var.ssm_param_name_github_token
}
