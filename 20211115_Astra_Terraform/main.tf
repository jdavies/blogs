terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
  required_providers {
    astra = {
      source = "datastax/astra"
      version = "1.0.10"
    }
  }
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "results" {
  value = "database_id = ${astra_database.insurance_db.id} testvar = ${var.testvar}"
  description = "Test Description"
}

output "token" {
  value = "value = ${astra_token.api_token.token}"
  description = "Token information - DO NOT LOSE"
}

output "client_secretx" {
  value = "value = ${astra_token.api_token.secret}"
  description = "Token information - DO NOT LOSE"
}

output "client_idx" {
  value = "value = ${astra_token.api_token.client_id}"
  description = "Token information - DO NOT LOSE"
}