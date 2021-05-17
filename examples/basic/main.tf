// Example loading API key from AWS Secret Manager
// Secret contains both API and APP key in this example, in JSON format
// { "API_KEY": "foo", "APP_KEY": "bar" }

data "aws_secretsmanager_secret_version" "datadog_keys" {
  secret_id = "ARN_HERE"
}

module "terraform-helm-datadog-test" {
  source          = "git@github.com:sepulworld/terraform-helm-datadog.git?ref=0.0.1"
  datadog_api_key = jsondecode(data.aws_secretsmanager_secret_version.datadog_keys.secret_string)["API_KEY"]
  datadog_app_key = jsondecode(data.aws_secretsmanager_secret_version.datadog_keys.secret_string)["APP_KEY"]
}
