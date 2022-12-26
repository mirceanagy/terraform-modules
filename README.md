# Modules
Terraform modules to reuse in Terragrunt

# AWS API Gateway module

Terraform module which creates a REST API Gateway with a stage and a custom domain name under a pre-existing DNS zone ID with an pre-existing ACM certificate
Note that this module creates a mock GET method on the root resource because CloudFormation refuses to create a stage without resources.

## Usage

```hcl
module "cluster" {
  source  = "terraform-aws-modules/rds-api-gateway/aws"

  api_gateway_name       = "testapi"
  api_gateway_stage_name = "exp"
  dns_zone_id            = "Z04502517OZXOXHZJD9E"
  api_gateway_domain_name = "api-test.com"
  api_gateway_domain_certificate_arn = "arn:aws:acm:us-east-1:11111111111:certificate/918f9362-3b24-435f-9fd0-7c0b95890339"
}
```

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-rds-aurora/tree/master/LICENSE) for full details.