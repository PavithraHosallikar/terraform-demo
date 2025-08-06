# Terraform Demo with GitHub Actions

This repository demonstrates GitHub Actions workflow with Terraform and manual approval process.

## ��️ What This Creates

- **Resource Group**: For each environment (dev/prod)
- **Storage Account**: For each environment (dev/prod)
- **Random suffix**: To ensure unique names

## 🚀 How It Works

1. **Push to `dev` branch** → Deploys to dev environment
2. **Push to `prod` branch** → Deploys to prod environment
3. **Manual trigger** → Choose environment manually

## 🔐 Manual Approval

The workflow pauses after Terraform plan and waits for manual approval before applying changes.

## 📋 Prerequisites

- Azure Service Principal configured
- GitHub secrets set up
- GitHub environments configured with protection rules

## 🎯 Testing

1. Push to `dev` branch to test automatic deployment
2. Use manual trigger to test different environments
3. Verify manual approval process works