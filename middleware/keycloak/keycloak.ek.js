let configuration = {
    "description" : "OpenIdConnect gateway",
    "dependsOn" : [
        "postgres",
        "ingress"
    ]
}

postgres
    .create("keycloak",[],true)

easykube
    .preload({"keycloak/keycloak:22.0.5" : "localhost:5001/keycloak/keycloak:22.0.5"})
    .kustomize()
    .waitForDeployment("keycloak-server","default")


