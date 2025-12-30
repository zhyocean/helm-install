kubectl create ns kruise-system
kubectl annotate namespace kruise-system meta.helm.sh/release-name=kruise
kubectl annotate namespace kruise-system meta.helm.sh/release-namespace=kruise-system
kubectl label namespace kruise-system app.kubernetes.io/managed-by=Helm

helm install kruise kruise-1.8.0.tgz -n kruise-system --set  manager.image.repository=openkruise-registry.cn-shanghai.cr.aliyuncs.com/openkruise/kruise-manager
helm install kruise-rollout kruise-rollout-0.6.1.tgz -n kruise-system --set  image.repository=openkruise-registry.cn-shanghai.cr.aliyuncs.com/openkruise/kruise-rollout
helm install -n maip-system rollout-webhook rollout-webhook-v1.tgz
