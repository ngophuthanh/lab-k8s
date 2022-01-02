# resource "helm_release" "this" {
#   name  = "redis"
#   chart = "https://charts.bitnami.com/bitnami/redis-10.7.16.tgz"
# }

resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = kubernetes_namespace_v1.this.metadata.0.name
  repository = "https://prometheus-community.github.io/helm-charts"

  # When you want to directly specify the value of an element in a map you need \\ to escape the point.
  set {
    name  = "podSecurityPolicy\\.enabled"
    value = true
  }

  set {
    name  = "server\\.persistentVolume\\.enabled"
    value = false
  }

  set {
    name = "server\\.resources"
    # You can provide a map of value using yamlencode  
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }
}
