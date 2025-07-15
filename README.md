# AWS EC2 Health Monitoring System

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?logo=terraform)](https://terraform.io)
[![Python](https://img.shields.io/badge/python-3.8%2B-blue?logo=python)](https://python.org)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-aws)](https://aws.amazon.com)

A Terraform + Python solution for provisioning and monitoring AWS EC2 instances. Deploys 3 EC2 instances with custom configurations and provides real-time health checks using Boto3.

## Features
- **Infrastructure as Code**: Terraform-managed AWS resources (VPC, subnets, security groups, EC2)
- **Automated Monitoring**: Python script checks instance status every 5 seconds
- **Custom Configuration**: 
  - SSH access restricted to your IP
  - HTTP access on port 8080
  - Bootstrap scripts via user data
- **Multi-Instance Support**: Simultaneously monitors 3 EC2 instances

## Project Structure
```bash
aws-ec2-health-monitor/
├── terraform/               # Infrastructure code
│   ├── main.tf              # Primary resource configuration
│   ├── providers.tf         # Terraform provider setup
│   ├── terraform.tfvars     # Variable definitions (example)
│   ├── entry-script.sh      # Instance bootstrap script
│   ├── health_check_app.py  # Health monitoring script
│   └── secret.tfvars        # Sensitive variables (GITIGNORED)
├── .gitignore
└── README.md
```
## Prerequisites
- AWS Account with IAM credentials

- Terraform v1.0+

- Python 3.8+ with Boto3 (pip install boto3 schedule)

- AWS CLI configured with credentials

## Usage
```bash
cd terraform
terraform init
terraform apply -var-file="secret.tfvars" -var-file="terraform.tfvars" -auto-approve
python3 health_check_app.py
```
### Sample Output
```bash
Instance i-0123456789abcdef0 is running with instance status ok and system status ok
Instance i-0fedcba9876543210 is running with instance status ok and system status ok
Instance i-0a1b2c3d4e5f6g7h8 is running with instance status ok and system status ok
#############################
```

## Cleanup
```bash
terraform destroy -var-file="secret.tfvars" -var-file="terraform.tfvars" -auto-approve
```
## License
MIT License - See LICENSE for details
