{{/*
Compile all validation checks here.
*/}}
{{- define "omni-exporter.validateValues" -}}
{{- if not .Values.omni.endpoint -}}
{{- fail "omni.endpoint is required (e.g. https://<account>.omni.siderolabs.io)" -}}
{{- end -}}
{{- if and (not .Values.omni.serviceAccountKey.existingSecret) (not .Values.omni.serviceAccountKey.value) -}}
{{- fail "omni.serviceAccountKey: set either .existingSecret or .value" -}}
{{- end -}}
{{- if and .Values.webConfig.enabled (not .Values.webConfig.existingSecret) (not .Values.webConfig.content) -}}
{{- fail "webConfig.enabled: set either webConfig.existingSecret or webConfig.content" -}}
{{- end -}}
{{- end -}}
