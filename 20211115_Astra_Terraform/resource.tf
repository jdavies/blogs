# Create the database
resource "astra_database" "insurance_db" {
  name           = "insurance"
  keyspace       = "insurance"
  cloud_provider = "gcp"
  region         = "us-west1"
}