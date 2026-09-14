variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "github_actions_role_arn" {
  description = "IAM role used by GitHub Actions to deploy to EKS"
  type        = string
  default     = "arn:aws:iam::293930531475:role/GitHubActionsDevOpsCapstoneRole"
}