variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether helm_resource is enabled"
}

variable "helm_chart_name" {
  type        = string
  default     = "datadog"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "2.13.0"
  description = "Version of the Datadog Helm chart to use"
}

variable "helm_release_name" {
  type        = string
  default     = "datadog"
  description = "Helm release name"
}

variable "helm_repo_url" {
  type        = string
  default     = "https://helm.datadoghq.com"
  description = "Helm repository for datadog chart"
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Have helm_resource create the namespace, default true"
}

variable "repository_key_file" {
  type        = string
  default     = null
  description = "(Optional) The repositories cert key file"
}

variable "repository_cert_file" {
  type        = string
  default     = null
  description = "(Optional) The repositories cert file"
}

variable "repository_ca_file" {
  type        = string
  default     = null
  description = "(Optional) The repositories CA file"
}

variable "repository_username" {
  type        = string
  default     = null
  description = "(Optional) Username for HTTP basic authentication against the repository."
}

variable "repository_password" {
  type        = string
  default     = null
  description = "(Optional) Password for HTTP basic authentication against the repository."
}

variable "devel" {
  type        = bool
  default     = false
  description = "(Optional) Use chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored."
}

variable "verify" {
  type        = bool
  default     = false
  description = "(Optional) Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. For more information see the Helm Documentation. https://helm.sh/docs/topics/provenance/  Defaults to false."
}

variable "keyring" {
  type        = bool
  default     = false
  description = "(Optional) Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. For more information see the Helm Documentation. Defaults to false."
}

variable "timeout" {
  type        = number
  default     = 300
  description = "(Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
}

variable "disable_webhooks" {
  type        = bool
  default     = false
  description = "(Optional) Prevent hooks from running. Defauts to false"
}
variable "reuse_values" {
  type        = bool
  default     = false
  description = "(Optional) When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false."
}

variable "reset_values" {
  type        = bool
  default     = false
  description = "(Optional) When upgrading, reset the values to the ones built into the chart. Defaults to false."
}

variable "force_update" {
  type        = bool
  default     = false
  description = "(Optional) Force resource update through delete/recreate if needed. Defaults to false"
}

variable "recreate_pods" {
  type        = bool
  default     = false
  description = "(Optional) Perform pods restart during upgrade/rollback. Defaults to false."
}

variable "cleanup_on_fail" {
  type        = bool
  default     = false
  description = "(Optional) Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false."
}

variable "max_history" {
  type        = number
  default     = 0
  description = "(Optional) Maximum number of release versions stored per release. Defaults to 0 (no limit)."
}

variable "atomic" {
  type        = bool
  default     = false
  description = "(Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false."
}

variable "skip_crds" {
  type        = bool
  default     = false
  description = "(Optional) If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false."
}

variable "render_subchart_notes" {
  type        = bool
  default     = true
  description = "(Optional) If set, render subchart notes along with the parent. Defaults to true."
}

variable "disable_openapi_validation" {
  type        = bool
  default     = false
  description = "(Optional) If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema. Defaults to false."
}

variable "wait" {
  type        = bool
  default     = true
  description = "(Optional) Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
}

variable "wait_for_jobs" {
  type        = bool
  default     = false
  description = "(Optional) If wait is enabled, will wait until all Jobs have been completed before marking the release as successful. It will wait for as long as timeout. Defaults to false."
}

variable "dependency_update" {
  type        = bool
  default     = false
  description = "(Optional) Runs helm dependency update before installing the chart. Defaults to false."
}

variable "replace" {
  type        = bool
  default     = false
  description = "(Optional) Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false."
}

variable "description" {
  type        = string
  default     = "Terraform driven Helm release of Datadog Helm chart"
  description = "(Optional) Set release description attribute (visible in the history)."
}

variable "lint" {
  type        = bool
  default     = false
  description = "(Optional) Run the helm chart linter during the plan. Defaults to false."
}

variable "k8s_namespace" {
  type        = string
  default     = "datadog"
  description = "The K8s namespace in which to install the Helm chart, default: 'default'"
}

variable "datadog_api_key" {
  type        = string
  default     = ""
  description = "Provide the datadog API key to be used with datadog agent pods, default empty string"
}

variable "datadog_app_key" {
  type        = string
  default     = ""
  description = "Provide the datadog APP key to be used with datadog agent pods, default empty string"
}

variable "enable_dd_cluster_agent" {
  type        = string
  default     = "true"
  description = "Flag to enable Datadog Cluster Agent, default true"
}

variable "enable_metrics_provider" {
  type        = string
  default     = "false"
  description = "Flag to enable metrics server provider, default false"
}

variable "datadog_agent_site" {
  type        = string
  default     = "datadoghq.com"
  description = "The datadog endpoint to send metrics to, default datadoghq.com"
}

variable "values" {
  type        = list(any)
  default     = null
  description = "(Optional) List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options."
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://github.com/DataDog/helm-charts/blob/master/charts/datadog/values.yaml for possible values"
}

variable "sensitive_settings" {
  type        = map(any)
  default     = {}
  description = "Additional sensitive settings which will be passed to the Helm chart values, see https://github.com/DataDog/helm-charts/blob/master/charts/datadog/values.yaml for possible values"
}
