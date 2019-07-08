output "codebuild_project_name" {
  description = "CodeBuild project name"
  value       = module.codebuild_tf_lambda_deploy.codebuild_project_name
}

output "codepipeline_pipeline_name" {
  description = "CodePipeline pipeline name"
  value       = module.codebuild_tf_lambda_deploy.codepipeline_pipeline_name
}
