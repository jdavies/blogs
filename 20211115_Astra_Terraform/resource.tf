# Create the database
resource "astra_database" "insurance_db" {
  name           = "insurance"
  keyspace       = "insurance"
  cloud_provider = "gcp"
  region         = "us-west1"
}

resource "astra_role" "insurance_admin" {
  role_name   = "ins_admin"
  description = "Database administrator for the Insurance database"
  effect      = "allow"
  # Select the resources for which we will create policies
  resources   = ["drn:astra:org:d909ab0b-84e7-40b4-acdc-47c6f92db299", 
    "drn:astra:org:d909ab0b-84e7-40b4-acdc-47c6f92db299:db:${astra_database.insurance_db.id}",
    "drn:astra:org:d909ab0b-84e7-40b4-acdc-47c6f92db299:db:${astra_database.insurance_db.id}:keyspace:insurance"]
  policy      = [
    # Keyspace
    "db-keyspace-alter", "db-keyspace-authorize", "db-keyspace-create", 
    "db-keyspace-describe", "db-keyspace-drop", "db-keyspace-grant", "db-keyspace-modify", 
    # API Access
    "db-cql", "db-graphql", "db-rest", 
    # Table Access
    "db-table-create", "db-table-drop", "db-table-describe", "db-table-alter", 
    "db-table-select", "db-table-grant", "db-table-modify", "db-table-authorize"]
}

# Generate a token for our custom role
resource "astra_token" "api_token" {
  roles = ["ins_admin"]
}