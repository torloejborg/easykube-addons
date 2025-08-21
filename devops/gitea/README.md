# Gitea

https://about.gitea.com/

This addon installs the "gitea" an open-source inspired version of GitHub. Its purpose is to provide a compatible repository service which provides a source for ArgoCD consumption. 


During installation a Postgres database will be provisioned. Local storage is provided in the "git-data" folder, exposed as a persistent volume in the cluster. If storage fails to allocate you might need to re-initialize the cluster via create/destroy.

When the installation completes, you can access the UI at http://git.localtest.me

The admin user account is **git** / **git12345**
