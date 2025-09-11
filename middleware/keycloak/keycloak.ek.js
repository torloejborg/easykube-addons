let configuration = {
    "description" : "OpenIdConnect gateway",
    "dependsOn" : [
        "postgres",
        "ingress"
    ]
}

const images = new Map([
    ["keycloak/keycloak:22.0.5" , "localhost:5001/keycloak/keycloak:22.0.5"]
])

postgres.create("keycloak",[],false)

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("keycloak-server","default")
