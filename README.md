# Infrastructure as Code (IaC) with Terraform ☁️

This repository serves as a comprehensive collection of Terraform configurations designed to automate the provisioning of AWS cloud infrastructure. It demonstrates the transition from simple resource creation to complex, multi-tier architectural deployments.

## 🎯 Objectives
The goal of these projects is to implement **Immutable Infrastructure**. By defining the desired state in code, we ensure that environments are consistent, reproducible, and version-controlled, eliminating "configuration drift."

---

## 📂 Project Portfolio

### 1. Enterprise VPC Networking (`/vpc-terraform`)
Provisioning a custom Virtual Private Cloud (VPC) with public and private subnets, Internet Gateways, and Route Tables to ensure a secure network isolation boundary.

### 2. Managed Kubernetes Cluster (`/terraform-eks`)
Deployment of an **Amazon EKS (Elastic Kubernetes Service)** cluster. This includes:
- Cluster control plane configuration.
- Node group provisioning for worker nodes.
- IAM Role association for Kubernetes pod identities.

### 3. Scalable Compute (`/Creating Multiple EC2 and Deploying App`)
Demonstrating the use of `count` and `for_each` in Terraform to deploy multiple EC2 instances dynamically, paired with user-data scripts for automated application bootstrap.

### 4. Serverless Storage & State (`/S3-Bucket-Dynamodb`)
Implementing an S3 bucket for storage and a DynamoDB table for **Terraform State Locking**. This is critical for team collaboration to prevent state corruption during concurrent applies.

---

## 🛠️ Tech Stack
- **IaC Tool**: `Terraform`
- **Cloud Provider**: `AWS`
- **State Management**: `S3 Backend` + `DynamoDB Lock`
- **Orchestration**: `Amazon EKS`

## 🚀 Quick Start

### Prerequisites
- [Terraform Installed](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI Configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) (`aws configure`)

### Deployment Workflow
```bash
# Initialize the working directory and download providers
terraform init

# Generate and review an execution plan (Dry Run)
terraform plan

# Apply the changes to create infrastructure
terraform apply -auto-approve
```

---

## 🧠 DevOps Insights
- **Modularization**: I utilize modular structures to make the code reusable across different environments (Dev, Staging, Prod).
- **Security First**: Security groups are configured with the principle of "Least Privilege," opening only necessary ports.
- **State Integrity**: Using remote backends (S3) ensures that the infrastructure state is shared and secured.
