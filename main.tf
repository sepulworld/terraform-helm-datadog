resource "helm_release" "terraform-k8s-datadog" {
  count       = var.enabled ? 1 : 0
  name        = var.helm_release_name
  description = var.description
  repository  = var.helm_repo_url
  chart       = var.helm_chart_name
  version     = var.helm_chart_version
  values      = var.values

  namespace        = var.k8s_namespace
  create_namespace = var.create_namespace

  repository_key_file        = var.repository_key_file
  repository_cert_file       = var.repository_cert_file
  repository_ca_file         = var.repository_ca_file
  repository_password        = var.repository_password
  devel                      = var.devel
  verify                     = var.verify
  keyring                    = var.keyring
  timeout                    = var.timeout
  disable_webhooks           = var.disable_webhooks
  reuse_values               = var.reuse_values
  reset_values               = var.reset_values
  cleanup_on_fail            = var.cleanup_on_fail
  max_history                = var.max_history
  atomic                     = var.atomic
  skip_crds                  = var.skip_crds
  render_subchart_notes      = var.render_subchart_notes
  disable_openapi_validation = var.disable_openapi_validation
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs
  dependency_update          = var.dependency_update
  replace                    = var.replace
  lint                       = var.lint

  force_update  = var.force_update
  recreate_pods = var.recreate_pods

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  set {
    name  = "clusterAgent.enabled"
    value = var.enable_dd_cluster_agent
  }

  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = var.enable_metrics_provider
  }

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set_sensitive" {
    for_each = var.sensitive_settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
