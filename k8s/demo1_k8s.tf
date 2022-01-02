resource "kubernetes_namespace_v1" "this" {
  metadata {
    annotations = {
      name = "demo1"
    }

    labels = {
      mylabel = "demo1"
    }

    name = "demo1"
  }
}

resource "kubernetes_deployment_v1" "this" {
  metadata {
    name      = "demo1"
    namespace = kubernetes_namespace_v1.this.metadata.0.name
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "demo1"
      }
    }

    template {
      metadata {
        labels = {
          app = "demo1"
        }
      }

      spec {
        container {
          image = "nginx"
          name  = "demo1"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "this" {
  metadata {
    name      = "demo1"
    namespace = kubernetes_namespace_v1.this.metadata.0.name
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.this.spec.0.template.0.metadata.0.labels.app
    }

    type = "NodePort"

    port {
      node_port   = 30222
      port        = 80
      target_port = 80
    }
  }
}
