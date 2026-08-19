#!/bin/bash

set -e

REGION="us-east-1"

echo "======================================"
echo " AWS DEVOPS COST CHECK"
echo " Region: $REGION"
echo "======================================"

echo ""
echo "AWS ACCOUNT"
aws sts get-caller-identity

echo ""
echo "EKS CLUSTERS"
aws eks list-clusters --region "$REGION"

echo ""
echo "EC2 INSTANCES"
aws ec2 describe-instances \
  --region "$REGION" \
  --filters Name=instance-state-name,Values=running \
  --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name]' \
  --output table

echo ""
echo "NAT GATEWAYS"
aws ec2 describe-nat-gateways \
  --region "$REGION" \
  --filter Name=state,Values=available,pending \
  --query 'NatGateways[*].[NatGatewayId,State,SubnetId]' \
  --output table

echo ""
echo "LOAD BALANCERS"
aws elbv2 describe-load-balancers \
  --region "$REGION" \
  --query 'LoadBalancers[*].[LoadBalancerName,Type,State.Code]' \
  --output table

echo ""
echo "RDS DATABASES"
aws rds describe-db-instances \
  --region "$REGION" \
  --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,DBInstanceClass]' \
  --output table

echo ""
echo "======================================"
echo " COST CHECK COMPLETE"
echo "======================================"