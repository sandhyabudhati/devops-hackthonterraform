# coi-e2x-energy-service-terraform-setup

## Overview
This repository contains Terraform configurations to provision and manage infrastructure as code. Terraform simplifies managing cloud resources, enabling version-controlled and automated deployments.

## Features
- **Provider:** GCP
- **Resources:** Compute Run, Cloud Storage, VPC, IAM, etc.
- **State Management:** Remote backend support
- **Modules:** Reusable and modular Terraform code

---

## Prerequisites
Ensure the following prerequisites are installed on your local system:

- [Terraform](https://www.terraform.io/downloads) >= 1.0.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (configured with appropriate credentials)
- Access to a GCP project with necessary permissions
- [Git](https://git-scm.com/)

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

### 2. Configure GCP Credentials
Ensure your GCP CLI is authenticated and configured for the desired project:
```bash
gcloud auth login
gcloud config set project <your-gcp-project-id>
```

### 3. Initialize Terraform
Initialize the Terraform working directory to download necessary providers and modules:
```bash
terraform init
```

### 4. Review & Plan Changes
Review the infrastructure changes before applying them:
```bash
terraform plan
```

### 5. Apply Changes
Apply the Terraform configuration to provision resources:
```bash
terraform apply
```

### 6. Destroy Resources (Optional)
To destroy all resources created by Terraform:
```bash
terraform destroy
```

---

## Project Structure
```plaintext
.
├── main.tf          # Main Terraform configuration
├── variables.tf     # Input variables
├── outputs.tf       # Outputs from the resources
├── provider.tf      # Provider configurations
├── modules/         # Reusable modules
├── backend.tf       # Remote state configuration (optional)
└── README.md        # Documentation
```

---

## Remote State Configuration (Optional)
If you're using a remote backend (e.g., Google Cloud Storage), ensure you configure it in the `backend.tf` file.

Example for GCS:
```hcl
terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket"
    prefix = "infra/terraform.tfstate"
  }
}
```
Run `terraform init` again after updating the backend.

---

## Connecting to the Database Locally

Follow these steps to connect to the database locally:

### 1. Update System Packages

```bash
sudo apt update
```

### 2. Install Curl

```bash
sudo apt install -y curl
```

### 3. Download the Cloud SQL Auth Proxy Binary

```bash
curl -LO https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64
```

### 4. Make the Binary Executable

```bash
chmod +x cloud_sql_proxy.linux.amd64
```

### 5. Move the Binary to a System Directory

```bash
sudo mv cloud_sql_proxy.linux.amd64 /usr/local/bin/cloud_sql_proxy
```

### 6. Verify the Installation

```bash
cloud_sql_proxy --version
```

### 7. Create Connection to Local Database

Replace `<connection_name>` with your Cloud SQL instance connection name:

```bash
./cloud_sql_proxy -instances=<connection_name>=tcp:5432
```

---

## Best Practices
- Always run `terraform plan` before `terraform apply`.
- Use modules for reusable and cleaner code.
- Enable version control for Terraform state.
- Protect sensitive data by using `terraform.tfvars` and `.gitignore`.

---

## References
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Google Cloud Terraform Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs/)

---

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or bugs.