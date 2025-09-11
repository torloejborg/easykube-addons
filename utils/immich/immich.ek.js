let configuration = {
    "description" : "Self hosted photo manager",
    "dependsOn": [
        "ingress",
        "redis",
        "postgres"
    ],
    "extraMounts": [
        {
            "hostPath": "immich-data",
            "containerPath": "/storage/immich-data"
        }, {
            "hostPath": "immich-extra-volume",
            "containerPath": "/storage/ext-pictures"
        }]
}

postgres.create("immich", [], false)
postgres.runLocalScript("sql/init.sql", "immich")

const images = new Map([
    ["ghcr.io/immich-app/immich-server:release", "localhost:5001/ghcr.io/immich-app/immich-server:release"],
    ["ghcr.io/immich-app/immich-machine-learning:release", "localhost:5001/ghcr.io/immich-app/immich-machine-learning:release"]
])

easykube.preload(images).kustomize()