### Tests for local Minikube

```
minikube start
cd tests/local_tests/
terraform init; terraform plan; terraform apply
helm -ls -n kube-addons
```

Similar commands should work fine with Docker fo Mac and other local Docker/k8s installs
