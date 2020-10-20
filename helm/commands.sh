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