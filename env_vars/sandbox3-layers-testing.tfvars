terraform_state = {
  bucket = "937405989913-codetools-play-tf-state"
  key    = "codetools-layers-testing/terraform.tfstate"
}

namespace = "ccf"
stage     = "dev"
name      = "layers"

tags      = {
  Owner = "Airwalk Consulting"
}

github_owner = "AirWalk-Digital"
github_repo  = "ccf-lambda-layers"
git_branch   = "vish-testing-codebuild"
ssm_param_name_github_token = "github_ouath_token_codepipeline"

codebuild_project_description = "Airwalk CCF Lambda layers"

codebuild_iam_policy_arns = [
  "arn:aws:iam::aws:policy/AWSLambdaFullAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess",
  "arn:aws:iam::aws:policy/IAMFullAccess",
]

codepipeline_iam_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
]

codebuild_env_vars = [
    {
      name  = "TF_VERSION"
      value = "0.11.14"
    },
    {
      name  = "TF_ENV"
      value = "aws-sandbox3"
    },
    {
      name  = "TF_ACTION"
      value = "apply"
      #value = "destroy"
    },
    {
      name  = "TF_IN_AUTOMATION"
      value = "1"
    },
    //{
    //  name  = "TF_LOG"
    //  value = "DEBUG"  # Available options: TRACE, DEBUG, INFO, WARN or ERROR
    //}
]
