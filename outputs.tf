// Outputs for your TF module go here
//
// Run terraform-doc markdown . > README.md
// Define if needed

output "helm_app_version" {
    value = helm_release.terraform-k8s-datadog.app_version
}

output "helm_version" {
    value = helm_release.terraform-k8s-datadog.version
}

output "helm_revision" {
    value = helm_release.terraform-k8s-datadog.revision
}

output "helm_name" {
    value = helm_release.terraform-k8s-datadog.name
}