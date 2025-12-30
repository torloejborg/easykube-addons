let configuration = {
    "description" : "OpenIdConnect gateway",
    "dependsOn" : [
        "postgres",
        "ingress"
    ]
}

const images = new Map([
    ["docker.io/keycloak/keycloak:22.0.5" , "registry.localtest.me:5001/keycloak/keycloak:22.0.5"]
])

postgres.create("keycloak",[],false)

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("keycloak-server","default")
