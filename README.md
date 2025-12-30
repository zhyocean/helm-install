# Helm 安装资源库

本仓库用于管理 Kubernetes 相关 Helm Charts 的安装资源，包含监控、GPU 管理、工作负载管理等组件。

## 目录结构

```
helm-install/
├── gpu-operator/        # NVIDIA GPU Operator
├── kruise/            # OpenKruise 扩展套件
├── kube-prometheus/   # Prometheus 监控栈
├── volcano/           # 批量作业调度器
└── README.md
```

## 组件说明

### 1. Kube-Prometheus
Kubernetes 监控栈，包含 Prometheus、Grafana、Alertmanager 等组件。

**版本**: v0.85.0

**主要组件**:
- Prometheus: v3.5.0
- Grafana: 12.1.0
- Alertmanager: v0.28.1
- Node Exporter: v1.9.1
- Kube State Metrics: v2.16.0

**部署**:
```bash
cd kube-prometheus
./build.sh example.jsonnet
kubectl apply -f manifests/
```

**镜像加载 (Kind 集群)**:
```bash
./images-load.sh
```

### 2. GPU Operator
NVIDIA GPU Operator，用于在 Kubernetes 集群中自动部署和管理 GPU 资源。

**可用版本**:
- v24.3.0
- v25.10.1

**部署**:
```bash
cd gpu-operator/v24.3.0
helm install gpu-operator . -n gpu-operator --create-namespace
```

### 3. Kruise
OpenKruise 是 Kubernetes 的扩展套件，提供高级工作负载管理能力。

**可用版本**:
- kruise: 1.8.0
- kruise-rollout: 0.6.1
- kruise-state-metrics: 0.2.0

**部署**:
```bash
cd kruise
./start.sh
```

### 4. Volcano
Kubernetes 批量作业调度器，专为高性能计算、AI/ML 等场景设计。

**版本**: v1.13.0

**部署**:
```bash
cd volcano/v1.13.0
helm install volcano . -n volcano-system --create-namespace
```

## 前置要求

- Kubernetes 1.20+
- Helm 3.x
- kubectl
- (可选) Kind - 用于本地测试

## 快速开始

1. **克隆仓库**:
   ```bash
   git clone <repository-url>
   cd helm-install
   ```

2. **部署监控栈**:
   ```bash
   cd kube-prometheus
   ./build.sh example.jsonnet
   kubectl apply -f manifests/
   ```

3. **部署 GPU Operator (如需使用 GPU)**:
   ```bash
   cd gpu-operator/v25.10.1
   helm install gpu-operator . -n gpu-operator --create-namespace
   ```

4. **部署 Kruise**:
   ```bash
   cd kruise
   ./start.sh
   ```

5. **部署 Volcano**:
   ```bash
   cd volcano/v1.13.0
   helm install volcano . -n volcano-system --create-namespace
   ```

## 验证部署

```bash
# 检查 Pod 状态
kubectl get pods -A

# 访问 Grafana (默认 NodePort)
kubectl port-forward -n monitoring svc/grafana 3000:3000

# 访问 Prometheus
kubectl port-forward -n monitoring svc/prometheus-k8s 9090:9090
```

## 注意事项

- 各组件建议部署在独立的 Namespace 中
- 部署前请检查 values.yaml 配置文件
- 生产环境建议配置持久化存储
- GPU Operator 需要节点支持 NVIDIA GPU

## 相关文档

- [kube-prometheus 文档](https://github.com/prometheus-operator/kube-prometheus)
- [GPU Operator 文档](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/)
- [OpenKruise 文档](https://openkruise.io/)
- [Volcano 文档](https://volcano.sh/)

## License

请参考各组件目录下的 LICENSE 文件。
