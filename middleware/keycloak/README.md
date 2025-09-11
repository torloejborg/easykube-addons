# KeyCloak Addon

Installs a default keycloak server. You can use this to test OpenIdConnect flows locally against a real server.

When the addon is installed, visit https://keycloak.localtest.me

See https://www.keycloak.org

Note: This addon uses the core-dns trick. When you run a backend in the cluster, and configure it to use keycloak as an oauth provider, the address *keycloak.localtest.me* will resolve internally to the ClusterIP. 