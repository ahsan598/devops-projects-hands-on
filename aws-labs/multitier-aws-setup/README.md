# 🌐 Deploying a WordPress Website on AWS

This project demonstrates how to deploy a **highly available**, **scalable**, and **secure** WordPress website on AWS using core cloud services and best practices.

The architecture spans across multiple availability zones and includes components like **ALB**, **EC2**, **RDS**, **S3**, **Route 53**, **IAM**, and **CloudWatch**.

---

### 🧱 Resources Used

- Amazon **VPC** with public and private subnets across **2 Availability Zones (AZs)**
- **Internet Gateway** for outbound internet access
- **NAT Gateway** for private subnets to access internet (when required)
- **Security Groups** to manage EC2 and RDS traffic
- **Bastion Host** in public subnet for secure SSH into private instances
- **EC2 instances** for hosting WordPress (in private subnets)
- **Auto Scaling Group (ASG)** for scalability and fault tolerance
- **Application Load Balancer (ALB)** to distribute incoming web traffic
- **Amazon RDS (MySQL)** as backend database
- **Amazon S3** to store web files (plugins, media, themes)
- **IAM Role** for EC2 to access S3
- **Route 53** for domain registration and DNS routing
- **CloudWatch** for monitoring logs, metrics, and alerts


### 🧭 Architecture Diagram

![Architecture](https://github.com/ahsan598/aws-project-2/blob/main/aws-wordpress-website-diagram.svg)

---

## ⚙️ Setup Notes (Manual – AWS Console)

Here’s an overview of how the WordPress hosting environment was configured:

### 1. VPC & Subnet Setup
- Create a custom **VPC** with **2 public** and **2 private** subnets across **2 AZs**
- Attach an **Internet Gateway (IGW)** to the VPC
- Create and associate **route tables** for public/private subnets

### 2. NAT Gateway (for Private Subnet Internet Access)
- Launch NAT Gateway in each public subnet
- Allocate Elastic IPs
- Add routes from private subnets to NAT Gateway

### 3. Bastion Host
- Launch **EC2 instance** in public subnet (Amazon Linux)
- Assign Elastic IP and Security Group with SSH access
- Use this host to SSH into EC2s in private subnet

### 4. EC2 Instances for WordPress
- Launch **EC2 instances** in private subnets (via Bastion Host)
- Attach **IAM Role** allowing access to S3
- Install **Apache, PHP, WordPress**, and configure settings

### 5. S3 Bucket for Website Assets
- Upload WordPress themes, media, plugins etc. to an S3 bucket
- Ensure correct bucket policy and access via EC2 IAM role

### 6. RDS – MySQL Database
- Create **Amazon RDS (MySQL)** in private subnet
- Enable Multi-AZ for high availability
- Connect from EC2 via internal endpoint

### 7. Application Load Balancer (ALB)
- Create **ALB** in public subnets
- Target group pointing to private EC2 instances
- Configure listener on port 80 (or HTTPS if SSL added)

### 8. Auto Scaling Group (ASG)
- Define launch template with EC2 setup
- Attach ASG to target group
- Set scaling policies (CPU, health checks)

### 9. Route 53 & Domain Setup
- Register domain or create a hosted zone
- Point domain to ALB DNS name via A record (Alias)

### 10. Monitoring with CloudWatch
- Set up CloudWatch alarms for EC2, ALB, RDS metrics
- Collect logs from Apache or PHP using CloudWatch Agent


### 🧪 Testing the Deployment

- Visit domain via browser → check WordPress home page
- Test login, uploads (via S3), DB operations (via RDS)
- Scale EC2 instances and test auto-scaling behavior
- Terminate an EC2 instance and observe ASG response

---

### 📌 Notes & Cost Control

> ⚠️ **Important:**  
- NAT Gateway is a **billable per-hour** service — keep it disabled or delete when not in use.
- Delete **all resources** when not testing to avoid unexpected AWS charges.


### 🚀 Learning Outcome

- Real-world VPC architecture for secure multi-tier web application
- Use of ALB + ASG for load balancing and scalability
- Integration of S3, RDS, Route 53, IAM Roles, and CloudWatch
- Deep understanding of manual AWS provisioning (a step before automation)

---

> _"Before you automate with Terraform or CloudFormation, understand what you're building manually."_ 💡
