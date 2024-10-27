variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The region where the SQL instance will be created."
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
  default     = "my-sql-instance"
}

variable "database_name" {
  description = "The name of the database to create."
  type        = string
  default     = "mydatabase"
}

variable "db_user" {
  description = "The database user name."
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database user."
  type        = string
  sensitive   = true
}