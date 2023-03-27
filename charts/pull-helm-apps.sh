#!/bin/bash

INIT_DIR="$(dirname "$0")"
OUT_DIR="${OUTPUT_DIR:-$INIT_DIR/.}"
SHOULD_UNTAR="${UNTAR:-true}"

# Format:
# Repo_Name Repo_URL Chart_Name Chart_Version
HELM_REPOS=( \
    'alert-manager-webhook https://servicedeployed.github.io/alert-manager-webhook alert-manager-webhook 1.0.5' \
    'prometheus-community https://prometheus-community.github.io/helm-charts prometheus 20.0.0' \
    'aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver aws-ebs-csi-driver 2.17.2' \
    'k8s-dashboard https://kubernetes.github.io/dashboard kubernetes-dashboard 6.0.6' \
    'gpu-helm-charts https://nvidia.github.io/dcgm-exporter/helm-charts dcgm-exporter 3.1.3' \
    'nvdp https://nvidia.github.io/k8s-device-plugin nvidia-device-plugin 0.13.0' \
)

for repo in "${HELM_REPOS[@]}"
do
    set -- $repo # convert the "tuple" into the param args $1 $2...
    echo "Adding Helm Repos, please wait ..."
    helm repo add $1 $2
done

helm repo update

for repo in "${HELM_REPOS[@]}"
do
    set -- $repo # convert the "tuple" into the param args $1 $2...
    echo "Pulling Helm Repos, please wait ..."
    rm -rf $OUT_DIR/$3
    if [ $SHOULD_UNTAR = "true" ]; then
        echo "helm pull "$1/$3" --untar --untardir $OUT_DIR --version $4"
        helm pull "$1/$3" --untar --untardir $OUT_DIR --version $4
        # rm "$INIT_DIR/$3-$4.tgz"
    else
        echo "helm pull $1/$3 -d $OUT_DIR --version $4"
        helm pull $1/$3 -d $OUT_DIR --version $4
    fi
done