# AltSchool Cloud Engineering Capstone Project

## Overview
This project demonstrates the deployment of a microservices-based application, specifically the Socks Shop, on a Kubernetes cluster using Infrastructure as Code (IaaC). The deployment utilizes Terraform, Prometheus for monitoring, and Let's Encrypt for securing the application with HTTPS.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Deploying the Kubernetes Cluster](#deploying-the-kubernetes-cluster)
- [Monitoring and Logging](#monitoring-and-logging)
- [Security Enhancements](#security-enhancements)
- [Cleaning Up Resources](#cleaning-up-resources)
- [Future Improvements](#future-improvements)

## Prerequisites
- **Terraform**: Ensure that Terraform is installed on your machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
- **AWS CLI**: Install and configure the AWS CLI with your credentials.
- **kubectl**: Install `kubectl` to interact with your Kubernetes cluster.
- **Git**: Ensure Git is installed for cloning repositories.
- **AWS Account**: You will need an AWS account to provision the resources.

## Project Structure
\`\`\`
.
├── provider.tf          # Terraform provider configuration for AWS
├── vpc.tf               # Configuration for the VPC and networking resources
├── eks.tf               # Configuration for the EKS cluster
├── outputs.tf           # Output definitions for important resource details
└── README.md            # Project documentation
\`\`\`

## Setup Instructions

### 1. Clone the Repository
Clone this repository to your local machine:
\`\`\`bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
\`\`\`

### 2. Configure AWS CLI
Ensure your AWS CLI is configured with the appropriate credentials:
\`\`\`bash
aws configure
\`\`\`
Enter your \`AWS Access Key ID\`, \`AWS Secret Access Key\`, and specify the region (\`us-east-1\`).

### 3. Initialize Terraform
Initialize the Terraform working directory:
\`\`\`bash
terraform init
\`\`\`

### 4. Deploy the Kubernetes Cluster
To deploy the EKS cluster and associated resources, run:
\`\`\`bash
terraform apply
\`\`\`
Review the changes and confirm by typing \`yes\`.

### 5. Access the Kubernetes Cluster
After deployment, configure \`kubectl\` to access the Kubernetes cluster:
\`\`\`bash
aws eks --region us-east-1 update-kubeconfig --name socks-shop-cluster
\`\`\`

### 6. Deploy the Socks Shop Application
Use \`kubectl\` to deploy the Socks Shop application onto the Kubernetes cluster. Example:
\`\`\`bash
kubectl apply -f socks-shop.yaml
\`\`\`

## Monitoring and Logging
Prometheus and Grafana are set up for monitoring the Kubernetes cluster. The configurations for Prometheus and Grafana can be found in their respective YAML files within the project directory.

### Access Grafana Dashboard
To access the Grafana dashboard, use the following command to set up port forwarding:
\`\`\`bash
kubectl port-forward svc/grafana 3000:3000
\`\`\`
Navigate to \`http://localhost:3000\` in your browser.

## Security Enhancements
- **HTTPS**: The application is secured with Let's Encrypt certificates using Cert-Manager in Kubernetes.
- **Network Policies**: Network policies are implemented to restrict traffic between pods.

### Ansible Vault (Optional)
Sensitive data, such as API keys and passwords, are encrypted using Ansible Vault. Refer to the \`ansible-vault.yml\` file for more details.

## Cleaning Up Resources
To clean up all resources and avoid any ongoing costs, run:
\`\`\`bash
terraform destroy
\`\`\`
Review the resources to be destroyed and confirm by typing \`yes\`.

## Future Improvements
- Implement auto-scaling for the EKS worker nodes.
- Enhance security with IAM roles for service accounts.
- Explore additional monitoring tools like Datadog or New Relic.

## Acknowledgements
- [Terraform AWS EKS Module](https://github.com/terraform-aws-modules/terraform-aws-eks)
- [Socks Shop Microservices Demo](https://github.com/microservices-demo/microservices-demo)
"""
