let configuration = {
    "description" : "Administrative UI for postgres",
    "dependsOn" : [ "postgres", "ingress" ]
};
easykube.preload({"dpage/pgadmin4:latest" : "localhost:5001/dpage/pgadmin4:latest"})
    .kustomize()
    .waitForDeployment("pgadmin","default")

