helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm install demo-mysql stable/mysql
helm uninstall demo-mysql

helm get manifest demo-guestbook

Command                                                         |    Action
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
helm install [release] [chart]                                  |    Install a release                              Example: helm install demo-guestbook guestbook-v1 
helm install --generate-name [chart]                
helm install -f file
helm install --set foo=bar --set service.labels[0].name=foo

helm upgrade [release] [chart]                                  |    Upgrade a release revision                     Example: helm upgrade demo-guestbook guestbook-v1
helm rollback [release] [revision]                              |    Rollback TO a release revision                 Example: helm rollback demo-guestbook 1
helm history [release]                                          |    Print release history                          Example: helm history demo-guestbook
helm status [release]                                           |    Show release status                            Example: helm status demo-guestbook
helm get all [release]                                          |    Show details of a release                      Example: helm get all demo-guestbook

helm uninstall [release]                                        |    Uninstall a release                            Example: helm uninstall demo-guestbook
helm uninstall --keep-history [release]                 

helm list                                                       |    List releases

helm template [chart]                                           |    Creates the chart from a template locally      Example: helm template guestbook-v3
helm install [release] [chart] --dry-run --debug                |    Real installation with out commit              Example: helm install [release] [chart] --dry-run --debug 2>&1 | less  -- redirects from standard error


Temaplates
-----------

{{ .Values.service.name }}
{{ .Chart.Name }}       -----> Chart file
{{ .Release.Name }}     -----> Runtime
            Namespace
            Service
            Revision
            IsUpgrade
            IsInstall
{{ .Capabilities.KubeVersion }}
                 APIVersions
                        Minor
                        Major

Functions and pipelines
-----------------------

- Default: supplies a default value when the required value is not present:

{{ .Values.service.name  | default .Chart.Name }} // if .Values.service.name is not present, it uses .Chart.Name instead

Functions                                    |            Pipeline
-----------------------------------------------------------------------------------------------------------
default default_value required_value         |            required_value | default default_value
quote value                                  |            value | quote
uppter value                                 |            value | upper
truc value 63                                |            value | trunc 63
trimSuffix "-" value                         |            value | trimSuffix "-"
b64enc value                                 |            value | b64enc
randAlphaNum 10                              |            value | randAlphaNum 10
toYaml value                                 |            value | toYaml
printf format value...                       |            list value .... | join "-"

Examples: 
{{ .Values.service.name  | trunc 63 | trimSuffix "-" }}
{{ .Values.mongodbRootPassword  | b64enc | quote }}


With
------------

Example:

spec:
       {{ - with .Values.service -}}
       type: {{ .type}}
       port: {{ .port }}
       {{ - end }}

       the - removes the trailing or leading whitespaces