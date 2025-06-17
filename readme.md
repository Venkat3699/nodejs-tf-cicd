# Node.js + Terraform CI/CD Pipelines using GitHub Actions & AWS

This repository automates the provisioning of AWS infrastructure and the deployment of a Node.js application using **Terraform** and **GitHub Actions**. It includes:

- Terraform pipeline to provision AWS infrastructure
- Node.js application build, Dockerization, ECR push
- EC2 deployment with Docker
- Optional monitoring and logging

---

## 🚀 CI/CD Pipelines Overview

### 🏗️ Pipeline 1: Terraform Infrastructure Provisioning

Triggered on:
- Push to `main` branch in Terraform-specific directories

Steps:
1. Checkout code
2. Setup Terraform CLI
3. Initialize Terraform configuration
4. Validate and format code
5. Plan infrastructure changes
6. Apply configuration to provision resources (e.g., VPC, EC2, IAM, S3, ECR, etc.)

> ✅ AWS infrastructure is automatically managed and version-controlled via Terraform.

---

### ⚙️ Pipeline 2: Node.js Build, Test & Docker Image Push

Triggered on:
- Push to `main` branch

Steps:
1. Checkout source code
2. Install Node.js dependencies
3. Run tests
4. Scan code for secrets using Gitleaks
5. Build Docker image
6. Tag image with GitHub SHA
7. Push image to Amazon ECR
8. SSH into EC2 instance
9. Install AWS CLI (if not present)
10. Pull the latest Docker image from ECR
11. Stop and remove any existing container
12. Run updated Docker container

---

## 🌐 Application Endpoints

| Method | Endpoint | Description              |
|--------|----------|--------------------------|
| GET    | /health  | Health check             |
| GET    | /hello   | Returns greeting message |
| GET    | /        | Welcome message          |

---

## 📊 Monitoring & Alerting (Optional)

### ✅ Metrics Collection
- Use **Amazon CloudWatch Agent** or **Prometheus Node Exporter** on EC2.
- Deploy **Grafana** (self-hosted or Amazon Managed Grafana).

Suggested metrics to monitor:
- CPU & Memory usage
- Request per second (RPS)
- Error rates (4xx, 5xx)
- Container restarts

### 🔔 Alerting
- Set **CloudWatch Alarms** on key metrics (CPU, Memory, App errors)
- Notify via **Slack**, **Email**, or **SNS**


## 🧪 Local Testing

```bash
cd nodejs-app
npm install
npm test
