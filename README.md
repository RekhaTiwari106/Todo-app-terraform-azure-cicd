# Todo-App Infrastructure & CI/CD with Terraform on Azure

This repository contains the **Terraform infrastructure code** and **CI/CD workflows** for a Todo-App project. It demonstrates a complete end-to-end DevOps setup, including **multi-environment deployment**, **security scanning**, and **automation for frontend and backend deployments**.

## 🏗 Project Overview

The Todo-App consists of:
- **Frontend:** React.js website
- **Backend:** Python (Flask/FastAPI)
- **Database:** MS SQL
- **Infrastructure:** Azure

**Terraform manages:**
- 1 Resource Group
- 1 Virtual Network (VNet)
- 2 Virtual Machines (VMs)
- 1 MS SQL Server & Database
- 1 Key Vault for secrets

**Environments:**
- **dev** – Development/testing environment for feature work
- **prod** – Production-ready environment

## ⚡ CI/CD Pipeline

The repository uses **GitHub Actions** for CI/CD with the following features:

1. **Terraform workflow**
   - Reusable workflow for **dev** and **prod**
   - Parameterized for multiple environments
   - Automatic `terraform init`, `validate`, `plan`, and `apply`

2. **Security Scanning**
- **Checkov** – Scans Terraform for security & compliance issues
   - **tfsec** – Checks Terraform for best practices
   - Pipelines fail if critical security issues are found

3. **Production Approval**
   - Prod deployments require **manual approval** in GitHub Environments
   - Ensures safe, controlled deployments
