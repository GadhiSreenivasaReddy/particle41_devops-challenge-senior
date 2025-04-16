# Terraform Project - Modular Format

This project follows a modular format to manage your infrastructure effectively using Terraform.

## Steps to Run this Project

### Prerequisites
Ensure the following tools are installed and properly configured:
- AWS CLI
- GitHub
- Terraform

### Instructions
1. Clone the current repository.

2. Navigate to the Terraform directory by moving into the folder named `terraform`.
 ```
 cd ./terraform
```
3. Review and update the variables in the `terraform.tfvars` to match your specific requirements.

4. Review the `providers.tf` in the backend s3 you need to provide the bucketname and region

4. To validate the Terraform plan, use the `terraform plan` command and specify the `terraform.tfvars` file.
```
terraform plan -var-file="terraform.tfvars"
```

5. To apply or execute the Terraform plan, use the `terraform apply` command and specify the `terraform.tfvars` file.
```
terraform apply -var-file="terraform.tfvars"
```
6. To destroy the infrastructure, use the `terraform destroy` command and specify the `terraform.tfvars` file.
```
terraform destroy -var-file="terraform.tfvars"
```
