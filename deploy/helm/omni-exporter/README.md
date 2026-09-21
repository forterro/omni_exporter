# omni-exporter

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square)

Prometheus exporter for Sidero Omni — kube-state-metrics for Omni.
Deploys the siderolabs/omni_exporter binary and exposes per-cluster and
per-machine metrics on :10048. Standard-Kubernetes chart, no CRDs.

**Homepage:** <https://github.com/siderolabs/omni_exporter>

## Quick start

Create a read-only Omni service account (the `Reader` role is enough):

```sh
omnictl serviceaccount create --use-user-role=false --role=Reader omni-exporter
```

Store the printed key in a secret and install the chart against your Omni endpoint:

```sh
kubectl create secret generic omni-exporter-key \
  --from-literal=OMNI_SERVICE_ACCOUNT_KEY=<key>

helm install omni-exporter oci://ghcr.io/siderolabs/charts/omni-exporter \
  --set omni.endpoint=https://<account>.omni.siderolabs.io \
  --set omni.serviceAccountKey.existingSecret=omni-exporter-key \
  --set serviceMonitor.enabled=true
```

To scrape several Omni instances into a single Prometheus, deploy one release per
instance and set a distinct `omni.instance` on each — every series is then tagged
with `omni_instance=<name>`, and the bundled dashboard exposes it as a variable.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Sidero Labs | <info@siderolabs.com> | <https://www.siderolabs.com> |

## Source Code

* <https://github.com/siderolabs/omni_exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| containerPort | int | `10048` |  |
| dashboards.annotations | object | `{}` |  |
| dashboards.enabled | bool | `false` |  |
| dashboards.labels | object | `{}` |  |
| dashboards.namespace | string | `""` |  |
| dashboards.targetDirectory | string | `"/tmp/dashboards/Omni"` |  |
| exporter.enablePprof | bool | `false` |  |
| exporter.extraArgs | list | `[]` |  |
| exporter.logFormat | string | `"json"` |  |
| exporter.logLevel | string | `"info"` |  |
| extraEnv | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"siderolabs/omni_exporter"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/metrics"` |  |
| livenessProbe.httpGet.port | string | `"metrics"` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| omni.endpoint | string | `""` |  |
| omni.insecureSkipTLSVerify | bool | `false` |  |
| omni.instance | string | `""` |  |
| omni.serviceAccountKey.existingSecret | string | `""` |  |
| omni.serviceAccountKey.existingSecretKey | string | `"OMNI_SERVICE_ACCOUNT_KEY"` |  |
| omni.serviceAccountKey.value | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `65532` |  |
| podSecurityContext.runAsGroup | int | `65532` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65532` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| priorityClassName | string | `""` |  |
| prometheusRule.enabled | bool | `false` |  |
| prometheusRule.forClusterNotReady | string | `"15m"` |  |
| prometheusRule.forDown | string | `"10m"` |  |
| prometheusRule.forResync | string | `"15m"` |  |
| prometheusRule.labels | object | `{}` |  |
| prometheusRule.namespace | string | `""` |  |
| readinessProbe.httpGet.path | string | `"/metrics"` |  |
| readinessProbe.httpGet.port | string | `"metrics"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `15` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `10048` |  |
| service.portName | string | `"metrics"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.honorLabels | bool | `false` |  |
| serviceMonitor.instanceLabel | string | `"omni_instance"` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.namespace | string | `""` |  |
| serviceMonitor.relabelings | list | `[]` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| webConfig.content | string | `""` |  |
| webConfig.enabled | bool | `false` |  |
| webConfig.existingSecret | string | `""` |  |
