variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
  default     = "my-sql-instance"
}

variable "authorized_networks" {
  description = "List of authorized networks (in CIDR format)"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Allows all IP addresses
}

variable "database_name" {
  description = "Name of the initial database to create"
  type        = string
  default     = "mydatabase"
}

variable "db_user" {
  description = "Database admin user"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}
