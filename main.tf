terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"  # Lowest tier

    ip_configuration {
      ipv4_enabled = true

      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          value = authorized_networks.value
        }
      }
    }

    backup_configuration {
      enabled = false
    }

    disk_autoresize = true      # Updated from storage_auto_resize
    disk_size       = 10        # Updated from data_disk_size_gb
    disk_type       = "PD_SSD"  # Updated from data_disk_type
  }
}

resource "google_sql_user" "default" {
  name     = var.db_user
  password = var.db_password
  instance = google_sql_database_instance.default.name
}

resource "google_sql_database" "default" {
  name      = var.database_name
  instance  = google_sql_database_instance.default.name
  charset   = "utf8"
  collation = "utf8_general_ci"
}
