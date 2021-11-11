variable "token" {}

provider "astra" {
  // This can also be set via ASTRA_DB_TOKEN environment variable.
  token = var.token
}