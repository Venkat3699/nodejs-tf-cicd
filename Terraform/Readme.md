# Infrastructure as Code (IaC) with Terraform on AWS
This project provides a complete, secure, modular, and production-ready infrastructure using Terraform on AWS , including:
- VPC with public & private subnets
- Auto Scaling Group behind Application Load Balancer
- Amazon RDS (PostgreSQL/MySQL)
- ECR for Docker image storage
- IAM roles with least privilege
- Security best practices (HTTPS, encryption)

## 🧱 Architecture Overview:
**VPC** : Isolated network with public/private subnets.
**ALB** : Distributes traffic across healthy app instances.
**ASG** : Ensures consistent capacity and auto-recovery.
**RDS** : Managed PostgreSQL/MySQL database in private subnet.
**ECR** : Stores Docker images securely.
**IAM** : Least privilege access control.
**Security** : HTTPS via ACM, encrypted data, restricted SSH.

## ✅ Features
✅ **Modular Terraform**: Each component is reusable and isolated.
✅ **High Availability**: Multi-AZ deployment for RDS and EC2.
✅ **Auto Scaling**: Dynamic scaling based on health and demand.
✅ **HTTPS Enabled**: Free SSL certificate via AWS ACM.
✅ **Secrets Management**: Use AWS SSM Parameter Store or Secrets Manager.
✅ **Infrastructure as Code**: Version-controlled, reproducible infrastructure.
✅ **Least Privilege IAM Roles**: Secure access to AWS services.
✅ **Container Ready**: Designed for containerized applications (ECR).

## ⚙️ Prerequisites:
- AWS Account with programmatic access
- AWS CLI configured
- Terraform CLI installed
- Domain registered in Route 53 (for ACM cert DNS validation)
- Public Subnets if deploying internet-facing resources

### Configure AWS credentials
```
aws configure
```
### Terraform Commands
```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```