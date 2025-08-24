let configuration = {
    "dependsOn" : [
        "ingress",
        "redis",
        "postgres"
    ],
    "extraMounts": [{
        "hostPath": "immich-data",
        "containerPath": "/storage/immich-data"
    }]
}

postgres.create("immich",[],false)
postgres.runLocalScript("sql/init.sql","immich")

easykube.preload({
    "ghcr.io/immich-app/immich-server:release":"localhost:5001/ghcr.io/immich-app/immich-server:release",
    "ghcr.io/immich-app/immich-machine-learning:release":"localhost:5001/ghcr.io/immich-app/immich-machine-learning:release"
}).kustomize()