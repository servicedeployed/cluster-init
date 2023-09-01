# Initialization Helm Charts

`pull-helm-apps.sh` is a script that retrieves and mirrors the following repos for cluster-initialization.

## Available Charts

| Repo Name | URL | Chart Name | Chart Version |
|-----------|-----|------------|---------------|
| alert-manager-webhook | https://servicedeployed.github.io/alert-manager-webhook | alert-manager-webhook | 1.0.5 |
| prometheus-community | https://prometheus-community.github.io/helm-charts | prometheus | 20.0.0 |
| aws-ebs-csi-driver | https://kubernetes-sigs.github.io/aws-ebs-csi-driver | aws-ebs-csi-driver | 2.17.2 |
| k8s-dashboard | https://kubernetes.github.io/dashboard | kubernetes-dashboard | 6.0.6 |
| gpu-helm-charts | https://nvidia.github.io/dcgm-exporter/helm-charts | dcgm-exporter | 3.1.3 |
| nvdp | https://nvidia.github.io/k8s-device-plugin | nvidia-device-plugin | 0.13.0 |

## Adding the Repo

```shell
helm repo add sd-cluster-init https://servicedeployed.github.io/cluster-init
helm repo update
```
