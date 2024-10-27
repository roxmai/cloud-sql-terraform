
# README

### Google Cloud SQL Terraform Setup

This Terraform configuration creates a Google Cloud SQL database instance using the lowest available tier (`db-f1-micro`). It sets up a MySQL 5.7 instance with a specified database and user. The configuration allows public IP access without enforcing SSL, making it accessible from any IP address. **Use this setup with caution, as it exposes your database to the internet without strong authentication measures.**

#### ⚠️ **Security Warning**

- **Public Access:** The database instance accepts connections from any IP address (`0.0.0.0/0`). This makes your database accessible over the internet.
- **No SSL Enforcement:** SSL connections are not required, meaning data is transmitted without encryption.
- **Authentication:** While authentication is required, the password used should be strong to prevent unauthorized access.

**Ensure you understand the security implications before deploying this configuration. It is recommended to implement proper security measures for production environments.**

#### Prerequisites

- **Terraform:** Ensure you have Terraform installed. You can download it from [terraform.io](https://www.terraform.io/downloads).
- **Google Cloud Account:** You need a Google Cloud account with billing enabled.
- **Service Account:** Create a service account with the necessary permissions (e.g., `Cloud SQL Admin`).

#### Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-repo/google-cloud-sql-terraform.git
   cd google-cloud-sql-terraform
   ```

2. **Configure Variables**

   Rename the example variables file and fill in your details:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   Edit `terraform.tfvars` and set the following variables:

   - `project_id`: Your Google Cloud project ID.
   - `region`: Desired region (e.g., `us-central1`).
   - `instance_name`: Name for your Cloud SQL instance.
   - `database_name`: Name of the database to create.
   - `db_user`: Database username.
   - `db_password`: Database user password (use a strong password).

3. **Initialize Terraform**

   Initialize Terraform to download the necessary providers:

   ```bash
   terraform init
   ```

4. **Review the Plan**

   Preview the actions Terraform will take:

   ```bash
   terraform plan
   ```

5. **Apply the Configuration**

   Create the Cloud SQL instance and related resources:

   ```bash
   terraform apply
   ```

   Confirm the apply step by typing `yes` when prompted.

6. **Accessing the Database**

   After successful deployment, Terraform will output the connection details. Use these to connect to your database.

   Example using `mysql` client:

   ```bash
   mysql -h [PUBLIC_IP_ADDRESS] -u admin -p
   ```

#### Cleanup

To remove all resources created by this Terraform configuration:

```bash
terraform destroy
```

Type `yes` when prompted to confirm the destruction.

#### Notes

- **Billing:** Ensure you monitor your Google Cloud billing, even though this setup uses the lowest tier. Costs can incur based on usage and additional configurations.
- **Security:** For production use, configure authorized networks more restrictively and enable SSL. Also, use strong passwords and consider integrating with Google Cloud IAM.