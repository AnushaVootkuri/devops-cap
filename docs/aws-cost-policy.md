# AWS Cost Control Policy

## Objective

Build and test the DevOps Capstone using AWS while minimizing unnecessary costs.

## Rules

1. Only one EKS cluster will be created.
2. No production-size infrastructure.
3. No NAT Gateway unless specifically required.
4. No RDS during the initial EKS project.
5. No multiple EKS clusters.
6. No EKS Capabilities unless specifically required.
7. Avoid unnecessary public IPv4 addresses.
8. Avoid unnecessary Load Balancers.
9. EKS will be destroyed immediately after testing.
10. Terraform will be used to create and destroy infrastructure.
11. AWS resources will be tagged with the project name.
12. Cost checks will be performed before and after each AWS exercise.

## Lifecycle

terraform apply
    |
    v
Test
    |
    v
Collect evidence
    |
    v
terraform destroy
