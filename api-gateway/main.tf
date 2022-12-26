resource "aws_api_gateway_rest_api" "main" {
  name = var.api_gateway_name
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.main.id
  rest_api_id   = aws_api_gateway_rest_api.main.id
  stage_name    = var.api_gateway_stage_name
}

resource "aws_api_gateway_method" "root_get" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_rest_api.main.root_resource_id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "mock" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_rest_api.main.root_resource_id
  http_method = aws_api_gateway_method.root_get.http_method
  type = "MOCK"
}

resource "aws_api_gateway_method_response" "ok" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_rest_api.main.root_resource_id
  http_method = aws_api_gateway_method.root_get.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "mock" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_rest_api.main.root_resource_id
  http_method = aws_api_gateway_method.root_get.http_method
  status_code = aws_api_gateway_method_response.ok.status_code
}

resource "aws_api_gateway_domain_name" "main" {
  certificate_arn = var.api_gateway_domain_certificate_arn
  domain_name     = var.api_gateway_domain_name
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_api_gateway_method.root_get]
}

resource "aws_route53_record" "dns_mapping" {
  name    = aws_api_gateway_domain_name.main.domain_name
  type    = "A"
  zone_id = var.dns_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.main.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.main.cloudfront_zone_id
  }
}

resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = aws_api_gateway_rest_api.main.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  domain_name = aws_api_gateway_domain_name.main.domain_name
  base_path   = ""
}