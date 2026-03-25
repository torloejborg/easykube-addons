let configuration = {
    "description" : "Administrative UI for postgres",
    "dependsOn" : [ "postgres", "ingress" ]
};
easykube.preload({"docker.io/dpage/pgadmin4:latest" : `${registry_host}/dpage/pgadmin4:latest`})
    .kustomize()
    .waitForDeployment("pgadmin","default")

