output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = google_sql_database_instance.default.connection_name
}

output "database_name" {
  description = "The name of the created database."
  value       = google_sql_database.default.name
}

output "db_user" {
  description = "The database user name."
  value       = google_sql_user.default.name
}