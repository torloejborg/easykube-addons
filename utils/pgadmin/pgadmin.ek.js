let configuration = {
    "description" : "Administrative UI for postgres",
    "dependsOn" : [ "postgres", "ingress" ]
};
easykube.preload({"docker.io/dpage/pgadmin4:latest" : "registry.localtest.me:5001/dpage/pgadmin4:latest"})
    .kustomize()
    .waitForDeployment("pgadmin","default")

