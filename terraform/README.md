# 🚀 AWS Infrastructure with Terraform

This project sets up AWS infrastructure using Terraform with a modular approach. It provisions key AWS resources such as VPC, ECS Cluster, Application Load Balancer (ALB), IAM roles, CloudWatch configurations, and Security Groups.
---

## 📁 Project Structure

```bash
├── README.md
├── main.tf
├── modules
│   ├── alb
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── cloudwatch
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── ecs
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── iam
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── sg
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── output.tf
├── providers.tf
├── terraform.tfvars
└── variables.tf
