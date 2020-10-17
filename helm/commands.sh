helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm install demo-mysql stable/mysql
helm uninstall demo-mysql

helm get manifest demo-guestbook

Command                                     |    Action
                                            |    
helm install [release] [chart]              |    Install a release                      Example: helm install demo-guestbook guestbook-v1 
helm install --generate-name [chart]

helm upgrade [release] [chart]              |    Upgrade a release revision             Example: helm upgrade demo-guestbook guestbook-v1
helm rollback [release] [revision]          |    Rollback TO a release revision         Example: helm rollback demo-guestbook 1
helm history [release]                      |    Print release history                  Example: helm history demo-guestbook
helm status [release]                       |    Show release status                    Example: helm status demo-guestbook
helm get all [release]                      |    Show details of a release              Example: helm get all demo-guestbook

helm uninstall [release]                    |    Uninstall a release                    Example: helm uninstall demo-guestbook
helm uninstall --keep-history [release]

helm list                                   |    List releases

