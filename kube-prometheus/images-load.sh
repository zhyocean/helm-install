docker pull quay.io/prometheus/alertmanager:v0.28.1
docker pull quay.io/prometheus/blackbox-exporter:v0.27.0
docker pull ghcr.io/jimmidyson/configmap-reload:v0.15.0
docker pull quay.io/brancz/kube-rbac-proxy:v0.19.1
docker pull grafana/grafana:12.1.0
docker pull registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.16.0
docker pull quay.io/brancz/kube-rbac-proxy:v0.19.1
docker pull quay.io/prometheus/node-exporter:v1.9.1
docker pull quay.io/brancz/kube-rbac-proxy:v0.19.1
docker pull quay.io/prometheus/prometheus:v3.5.0
docker pull registry.k8s.io/prometheus-adapter/prometheus-adapter:v0.12.0
docker pull quay.io/prometheus-operator/prometheus-operator:v0.85.0

kind load docker-image --name zhygpu quay.io/prometheus/alertmanager:v0.28.1
kind load docker-image --name zhygpu quay.io/prometheus/blackbox-exporter:v0.27.0
kind load docker-image --name zhygpu ghcr.io/jimmidyson/configmap-reload:v0.15.0
kind load docker-image --name zhygpu quay.io/brancz/kube-rbac-proxy:v0.19.1
kind load docker-image --name zhygpu grafana/grafana:12.1.0
kind load docker-image --name zhygpu registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.16.0
kind load docker-image --name zhygpu quay.io/brancz/kube-rbac-proxy:v0.19.1
kind load docker-image --name zhygpu quay.io/prometheus/node-exporter:v1.9.1
kind load docker-image --name zhygpu quay.io/brancz/kube-rbac-proxy:v0.19.1
kind load docker-image --name zhygpu quay.io/prometheus/prometheus:v3.5.0
kind load docker-image --name zhygpu registry.k8s.io/prometheus-adapter/prometheus-adapter:v0.12.0
kind load docker-image --name zhygpu quay.io/prometheus-operator/prometheus-operator:v0.85.0
