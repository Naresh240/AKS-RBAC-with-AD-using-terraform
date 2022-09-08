# AKS-RBAC-with-AD-using-terraform

## Pre-requisites:

```bash
- login to azure
- Create Groups (dev and readonly group)
- Create Users and users to Groups
- Attach Role (Azure Kubernetes Service Cluster User Role) to Group
```

## Run Terraform by updating variable values

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## To destroy resources

```bash
terraform destroy
```
