#!/bin/bash

set -e

echo "======================================"
echo " AWS DEVOPS CAPSTONE INVENTORY"
echo "======================================"

echo ""
echo "AWS IDENTITY"
aws sts get-caller-identity

echo ""
echo "REGION"
aws configure get region

echo ""
echo "VPCS"
aws ec2 describe-vpcs \
  --query 'Vpcs[*].[VpcId,CidrBlock,IsDefault,State]' \
  --output table

echo ""
echo "SUBNETS"
aws ec2 describe-subnets \
  --query 'Subnets[*].[SubnetId,VpcId,AvailabilityZone,CidrBlock]' \
  --output table

echo ""
echo "EC2 INSTANCES"
aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType]' \
  --output table

echo ""
echo "EKS CLUSTERS"
aws eks list-clusters

echo ""
echo "RDS"
aws rds describe-db-instances \
  --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,Engine]' \
  --output table

echo ""
echo "NAT GATEWAYS"
aws ec2 describe-nat-gateways \
  --filter Name=state,Values=available,pending \
  --query 'NatGateways[*].[NatGatewayId,State,VpcId]' \
  --output table

echo ""
echo "LOAD BALANCERS"
aws elbv2 describe-load-balancers \
  --query 'LoadBalancers[*].[LoadBalancerName,Type,State.Code]' \
  --output table

echo ""
echo "======================================"
echo " INVENTORY COMPLETE"
echo "======================================"