resource "helm_release" "monitoring" {
  name       = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "89.2.2"

  namespace        = "monitoring"
  create_namespace = true

  values = [
    file("${path.module}/../helm/monitoring/values.yaml")
  ]

  wait          = true
  wait_for_jobs = true
  timeout       = 600

  depends_on = [
    aws_eks_node_group.main,
    aws_eks_addon.pod_identity_agent,
    aws_eks_addon.ebs_csi_driver,

    aws_eks_access_entry.devops_admin,
    aws_eks_access_policy_association.devops_admin_cluster_admin
  ]
}