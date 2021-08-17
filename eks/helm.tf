provider "helm" {
  kubernetes {
    config_path = module.eks.kubeconfig_filename
  }
}

resource "helm_release" "k8s-spot-termination-handler" {
  name       = "stable"
  namespace  = "kube-system"
  repository = "https://charts.helm.sh/stable"
  chart      = "k8s-spot-termination-handler"
  values = [
    <<-EOT
      nodeSelector:
        "beta.kubernetes.io/os": "linux"
    EOT
  ]
}