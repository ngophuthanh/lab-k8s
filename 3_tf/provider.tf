terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path    = var.config_info.config_path
  config_context = var.config_info.config_context
}

provider "helm" {
  kubernetes {
    config_path    = var.config_info.config_path
    config_context = var.config_info.config_context
  }
}
