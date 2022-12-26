variable "api_gateway_name" {
  description = "The name of API to create"
  type        = string
  default     = null
}

variable "api_gateway_stage_name" {
  description = "The name of stage to be created in the API"
  type        = string
  default     = null
}

variable "dns_zone_id" {
  description = "The ID of the DNS zone with which to associate the API gateway custom domain"
  type        = string
  default     = null
}

variable "api_gateway_domain_name" {
  description = "The custom domain name to associate with the created API gateway"
  type        = string
  default     = null
}

variable "api_gateway_domain_certificate_arn" {
  description = "The ARN of the certificate associated with the custom domain created for API gateway"
  type        = string
  default     = null
}

