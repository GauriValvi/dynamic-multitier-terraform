# 🌐 Dynamic Multi-Tier App Deployment with Terraform + AWS

This project demonstrates how to deploy a scalable, highly available web application architecture on AWS using Terraform. It includes a custom VPC, Load Balancer, Auto Scaling Group (EC2), and MySQL RDS — all provisioned as Infrastructure as Code.

---

## 📌 Project Highlights

- 🛠️ Built with Terraform (modular structure)
- ☁️ AWS Services: VPC, EC2, ALB, Auto Scaling, RDS (MySQL), Security Groups
- 🔁 Auto Healing with EC2 Auto Scaling Group
- 🌍 Application Load Balancer for traffic distribution
- 🐬 RDS hosted in private subnet for secure DB access
- 🔒 Fine-grained security using SG rules
- 🔄 Fully automated deployment using `terraform apply`

---

## 🧱 Architecture

Internet
|
[ Application Load Balancer ]
|
[ EC2 in Auto Scaling Group ]
|
[ RDS MySQL in Private Subnet ]

---

## 🗂️ Folder Structure

.
├── main.tf
├── vpc.tf
├── alb.tf
├── ec2_asg.tf
├── rds.tf
├── security.tf
├── outputs.tf
├── variables.tf
├── user_data.sh
└── .gitignore
---

## 🚀 Deployment Steps

```bash
terraform init
terraform validate
terraform plan
terraform apply

🔎 Access URLs
ALB Endpoint (Web App):
http://<your-alb-dns>

MySQL RDS Endpoint:
mysql -h <rds-endpoint> -u admin -p

💡 Author
Gauri Valvi
🔗 LinkedIn: https://www.linkedin.com/in/gauri-valvi/
📧 Email: gaurivalvi@gmail.com
