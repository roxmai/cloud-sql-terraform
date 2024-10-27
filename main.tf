provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "MYSQL_5_7"

  settings {
    tier = "db-f1-micro" # Lowest available tier

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = false

      # Allow connections from any IP address
      authorized_networks = [
        {
          name  = "public"
          value = "0.0.0.0/0"
        },
      ]
    }

    # Optional: Enable automatic storage increase
    storage_auto_resize = true
    # Optional: Set initial storage size in GB
    data_disk_size_gb = 10
  }
}

resource "google_sql_database" "default" {
  name     = var.database_name
  instance = google_sql_database_instance.default.name
}

# Note: Google Cloud SQL requires at least one user with authentication.
# To minimize authentication requirements, create a user with a simple password.
resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.default.name
  host     = "%"
  password = var.db_password
}