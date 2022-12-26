output "aws_api_gateway_deployment_id" {
  description = "The API gateway deployment id"
  value       = try(aws_api_gateway_deployment.main.id, "")
}

output "aws_api_gateway_domain_name_id" {
  description = "The API gateway custom domain id"
  value       = try(aws_api_gateway_domain_name.main.id, "")
}

output "aws_api_gateway_domain_name_arn" {
  description = "The API gateway custom domain ARN"
  value       = try(aws_api_gateway_domain_name.main.arn, "")
}

output "aws_api_gateway_rest_api_id" {
  description = "The API gateway custom domain id"
  value       = try(aws_api_gateway_rest_api.main.id, "")
}

output "aws_api_gateway_rest_api_arn" {
  description = "The API gateway custom domain ARN"
  value       = try(aws_api_gateway_rest_api.main.arn, "")
}

output "aws_api_gateway_rest_api_root_resource_id" {
  description = "The API gateway root resource id"
  value       = try(aws_api_gateway_rest_api.main.root_resource_id, "")
}

output "aws_api_gateway_stage_id" {
  description = "The API gateway stage id"
  value       = try(aws_api_gateway_stage.stage.id, "")
}

output "aws_api_gateway_stage_arn" {
  description = "The API gateway stage ARN"
  value       = try(aws_api_gateway_stage.stage.arn, "")
}

output "aws_api_gateway_stage_invoke_url" {
  description = "The API gateway stage ARN"
  value       = try(aws_api_gateway_stage.stage.invoke_url, "")
}