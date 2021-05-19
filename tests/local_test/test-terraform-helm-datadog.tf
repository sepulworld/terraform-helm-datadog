// Example tests here
//

// Alter your provider if you use a different local k8s install
provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "minikube"
  }
}

module "terraform-helm-datadog-test" {
  source          = "../../"
  datadog_api_key = var.datadog_api_key
  settings = {
    // Add tolerations for all taints example
    "agents.tolerations[0].effect"   = "NoSchedule"
    "agents.tolerations[0].operator" = "Exists"
    // Increase rolling update maxUnavailable example
    "agents.updateStrategy.rollingUpdate.maxUnavailable" = "30"
  }
}

variable "datadog_api_key" {
  type        = string
  default     = ""
  description = "provide as user input for testing"
}
