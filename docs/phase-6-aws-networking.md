# Phase 6 - AWS CLI and Networking

## AWS Region

us-east-1

## Authentication

AWS CLI is configured using the IAM user:

devops-admin

Root user is protected with MFA and is not used for normal DevOps operations.

## VPC

A VPC is an isolated logical network within AWS.

## Subnets

Subnets divide a VPC into smaller network segments.

## Availability Zones

Availability Zones provide isolated locations within an AWS Region.

Our future EKS environment will use multiple Availability Zones.

## Route Tables

Route tables determine where network traffic is sent.

Example:

10.0.0.0/16 -> local
0.0.0.0/0 -> Internet Gateway

## Internet Gateway

Provides Internet connectivity for resources in public subnets when routing and public addressing/security rules permit it.

## NAT Gateway

Allows private-subnet resources to initiate outbound Internet connections.

NAT Gateway will be used carefully because it can incur AWS charges.

## Security Groups

Security groups act as stateful firewalls for AWS resources.

## Important Ports

HTTP       80
HTTPS      443
Frontend   3000
Backend    8000
PostgreSQL 5432

## Security Design

PostgreSQL should never be directly exposed to the public Internet.

Expected traffic:

Internet
  |
Load Balancer
  |
Frontend
  |
Backend
  |
PostgreSQL

## Phase 6 Rule

No AWS infrastructure was manually created.

Networking was inspected using AWS CLI.

Terraform will create the project networking in a later phase.
